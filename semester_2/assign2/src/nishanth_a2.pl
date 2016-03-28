#!/usr/bin/perl

# Author:  Nishanth Merwin
# Purpose: BIF724 Perl Bioinformatics Semester 161 -- Assignment 2. This program pulls GenBank records
#          from NCBI's servers and parses them to isolate a single gene.



# I declare that the attached assignment is wholly my own work in accordance with
# Seneca Academic Policy. No part of this assignment has been copied manually or
# electronically from any other source (including web sites) or distributed to other students.
# Name: Nishanth Merwin
# ID: 117 318 154


use strict;
use warnings;

use Bio::DB::GenBank;
use Bio::SeqIO;
use Bio::Seq;


sub get_info_from_acc;

# Prints help message if anything is inputted other than 2 arguments.
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
	my $dnaFile = "dna_nishanth_$gene.fa";
	my $aaFile = "aa_nishanth_$gene.fa";

	my $dnaStream = Bio::SeqIO->new(-file=>">$dnaFile", -format=>"Fasta");
	my $aaStream = Bio::SeqIO->new(-file=>">$aaFile", -format=>"Fasta");

	open(my $fh,"<",$file);
	foreach my $genID(<$fh>){
	
		print "Pulling GenBank record: $genID .....";	
		my @info = get_info_from_acc($genID, $gene);

		my $dna_seq = Bio::Seq->new(-seq=>$info[1], -id=>$info[0]);
		my $aa_seq = Bio::Seq->new(-seq=>$info[2], -id=>$info[0]);

		$dnaStream->write_seq($dna_seq);
		$aaStream->write_seq($aa_seq);
		print "Done\n";
	}
	close($fh);
}



# Subroutine to get all the information required from genbank and parse into an array.
# INPUT:   1st elem --> GenBank ID
#          2nd elem --> Gene name
#
# OUTPUT:  1st elem --> Species name
#          2nd elem --> DNA sequence of gene
#          3rd elem --> Amino Acid sequence of protein
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

				# Getting the DNA
				my $start = $feature->start();
				my $end = $feature->end();
				my $strand = $feature->strand();
				$DNA = $seq->subseq($start,$end);
				if($strand == -1){
					$DNA = Bio::Seq->new(-seq=>$DNA)->revcom()->seq();
				}
			}
		}
	}
	# Returns the name, DNA and AA sequence of the gene of interest
	my @output = ($name, $DNA, $translation);
	return @output;
}
