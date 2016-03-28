use strict;
use warnings;


my $genID = "NC_013993";

my $gene = "COX1";

use Bio::SeqIO;


# my $dnaStream = Bio::SeqIO->new(-file=>"dna_nishanth_$gene.fa", -format=>"fasta");

# my $aaStream = Bio::SeqIO->new(-file=>"aa_nishanth_$gene.fa", -format=>"fasta");

use Bio::DB::GenBank;
use Bio::Seq;

if(scalar(@ARGV) != 2){
	print <<HERE;

This program collects and obtains genes with the same name from multiple GenBank records.
The following genes will be saved as fasta files in the current directory.

Provide the following arguments:

ARG 1: A text file containing a list of genbank records (Must be in current directory).
ARG 2: A specific gene name to search for.

HERE

	exit;
}
else{
	my $file = $ARGV[0];
	my $gene = $ARGV[1];


=pod
	open(FILE, ">dna_nishanth_$gene.fa");
	close(FILE);
	open(FILE, ">aa_nishanth_$gene.fa");
	close(FILE);
=cut

	
	my $dnaStream = Bio::SeqIO->new(-file=>"./dna_nishanth_$gene", -format=>"Fasta");
	my $aaStream = Bio::SeqIO->new(-file=>"./aa_nishanth_$gene", -format=>"Fasta");


	open(my $fh,"<",$file);
	foreach my $genID(<$fh>){
		
		my @info = get_info_from_acc($genID, $gene);

		my $dna_seq = Bio::Seq->new(-seq=>$info[1], -id=>$info[0]);
		my $aa_seq = Bio::Seq->new(-seq=>$info[2], -id=>$info[0]);


		my $dnaFH = $dnaStream->fh();
		my $aaFH = $aaStream->fh();

		print $dnaFH $dna_seq;
		print $aaFH $aa_seq;		

		$dnaStream->write_seq($dna_seq);
		$aaStream->write_seq($aa_seq);
	}
	close($fh);
}





sub get_info_from_acc(@){

	my $genID = shift;
	my $gene = shift;


	my $translation;
	my $DNA;
	my $name;


	# Gets the genbank file
	my $gb = Bio::DB::GenBank->new();
	my $seq = $gb->get_Seq_by_acc($genID);

	# Getting the species name and formatting it
	$name = $seq->species()->binomial("FULL");
	$name =~ s/\s/_/g;



	# Splits the genbank record into features
	my @features = $seq->get_SeqFeatures();
	foreach my $feature(@features){

		# gets the CDS part of the GB file
		if($feature->primary_tag() eq "CDS"){

			# Checks whether its the gene of interest
			my @geneNames = $feature->get_tag_values("gene");
			if( $geneNames[0] eq $gene){
				
				# Getting the translation
				my @translations = $feature->get_tag_values("translation");
				$translation = $translations[0];

				# Getting the DNA;
				my $start = $feature->start();
				my $end = $feature->end();
				my $strand = $feature->strand();
				$DNA = $seq->subseq($start,$end);
				if($strand == -1){
					$DNA = $DNA->revcom();
				}
			}
		}
	}
	# Returns the name, DNA and AA sequence of the gene of interest
	my @output = ($name, $DNA, $translation);
	return @output;
}


