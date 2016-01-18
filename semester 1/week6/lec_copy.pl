use strict;
use warnings;

# File I/O
# Writing files immediately clears the contents of the file

my $ifile = "lec.pl";

my $ofile = "lec_copy.pl";

open(IN, $ifile) || die("Error opening file: $ifile ... MessageL $!\n");

open(OUT, "> $ofile") || warn("Error opening file: $ofile... (must be a permission issue) $!\n");


my $line;

while($line= <IN>){
	print "$line";
	print OUT $line; 
}