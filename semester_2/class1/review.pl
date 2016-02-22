use strict;
use warnings;

# Authors: Nishanth Merwin, Tyler Murphy, Juan Diego Mora
# Client: Review activity for BIF 724 (Perl for Bioinformatics @ Seneca - 161)
# Purpose: Simple exercise for reading ORFs from a FASTA file.




# File slurp
my $file = "MT.fa";
$/ = undef;
open(FD,"< $file");
my 	$mRNA = <FD>;
close(FD);
$/ = "\n";

# Remove first line
my @mRNA = split("\n",$mRNA);
@mRNA = @mRNA[1 .. scalar(@mRNA)-1];
$mRNA = join("",@mRNA);



# Convert to RNA
$mRNA =~ tr/[^ATCG]//cd;
$mRNA =~ tr/T/U/;



my $start;
my $ORF;
my @array;
my $forward=0;
my $reverse=0;
my $count=0;



# regex that counts non-overlapping ORFS in the + strand
while($mRNA =~ /(AUG([AUGC]{3})+?(UAA|UAG|UGA))/g){
		$forward++;
}

# Finding the reverse complement
$mRNA = reverse($mRNA);
$mRNA =~ tr/AUCG/UAGC/;

# regex that counts non-overlapping ORFS in the - strand
while($mRNA =~ /(AUG([AUGC]{3})+?(UAA|UAG|UGA))/g){
		$reverse++;
}
print "\n\n\n\n$forward ORFs in the + strand; $reverse ORFs in the - strand.\n\n\n";

exit;



# Using loops instead of regex
for(my $i=0; $i < length($mRNA); $i++){
	$start = substr($mRNA,$i,3);
	if($start eq "AUG"){
		$ORF = substr($mRNA,$i);
		@array = ( $ORF =~ m/.../g );
		for(my $j = 0; $j < scalar(@array); $j++){
			if($array[$j] eq "UGA" || $array[$j] eq "UAA" || $array[$j] eq "UAG"){
				splice(@array, $j+1);
				
				# Ensures that ORFs are non-overlapping
				if(scalar(@array)>1){
					print "@array\n\n";
					$forward++;	
					$i = $i + 3*$j;
				}	
			}
		}
	}
}



# Finding the reverse complement
$mRNA = reverse($mRNA);
$mRNA =~ tr/AUCG/UAGC/;


for(my $i=0; $i < length($mRNA); $i++){
	$start = substr($mRNA,$i,3);
	if($start eq "AUG"){
		$ORF = substr($mRNA,$i);
		@array = ( $ORF =~ m/.../g );
		for(my $j = 0; $j < scalar(@array); $j++){
			if($array[$j] eq "UGA" || $array[$j] eq "UAA" || $array[$j] eq "UAG"){
				splice(@array, $j+1);
				
				if(scalar(@array)>1){
					print "@array\n\n";
					$reverse++;	
					$i = $i + 3*$j;
				}
			}
		}
	}
}

print "$forward ORFs in the + strand; $reverse ORFs in the - strand";

