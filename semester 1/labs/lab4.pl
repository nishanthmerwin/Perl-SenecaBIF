#!c:\strawberry\perl\bin\prel.exe
sub cleaveAndBind($$$$);

use strict;
use warnings;

my (@dna1, @dna2, $seq, $pos, $i, $ok);
$dna1[0][0] = "5p-sequence-PPPPPP-GAATTC-QQQQQQ-sequence-3p";
$dna1[1][0] = "3p-sequence-QQQQQQ-CTTAAG-PPPPPP-sequence-5p";

$dna2[0][0] = "5p-sequence-XXXXXX-GAATTC-YYYYYY-sequence-3p";
$dna2[1][0] = "3p-sequence-YYYYYY-CTTAAG-XXXXXX-sequence-5p";

$seq = "GAATTC";
$pos = 1;

$ok = cleaveAndBind(\@dna1, \@dna2, \$seq, \$pos);





print $dna1[0][0], "\n", $dna1[1][0], "\n", $dna2[0][0], "\n", $dna2[1][0], "\n" if($ok);

$seq = "GAACTT";
$ok = cleaveAndBind(\@dna1, \@dna2, \$seq, \$pos);
print $dna1[0][0], "\n", $dna1[1][0], "\n", $dna2[0][0], "\n", $dna2[1][0], "\n" if($ok);

exit;

sub cleaveAndBind($$$$) {
	my ($ref1,$ref2,$ref3, $ref4);
	$ref1 = shift(@_);
	$ref2 = shift(@_);
	$ref3 = shift(@_);
	$ref4 = shift(@_);
	
	
	if (index(${$ref1}[0][0],${$ref3}) != -1 && index(${$ref2}[0][0],${$ref3}) != -1){
		
		# Finds the indices of the cut and stop sites
		my $cutStartA = index(${$ref1}[0][0],${$ref3}) + ${$ref4};
		my $cutStartB = $cutStartA + length(${$ref3}) - ${$ref4};
		my $cutStartC = index(${$ref2}[0][0],${$ref3}) + ${$ref4};
		my $cutStartD = $cutStartC + length(${$ref3}) -${$ref4};
		
		# Restriction cutting and storing in variable
		my $strA = substr(${$ref1}[0][0],0,$cutStartA) . substr(${$ref2}[0][0],$cutStartC);
		my $strB = substr(${$ref1}[1][0],0,$cutStartB) . substr(${$ref2}[1][0],$cutStartD);
		my $strC = substr(${$ref2}[0][0],0,$cutStartC) . substr(${$ref1}[0][0],$cutStartA);
		my $strD = substr(${$ref2}[1][0],0,$cutStartD) . substr(${$ref1}[1][0],$cutStartB);
		
		# Pushing the spliced together strings into the original references
		${$ref1}[0][0] = $strA;
		${$ref1}[1][0] = $strB;
		${$ref2}[0][0] = $strC;
		${$ref2}[1][0] = $strD;
	}
	else{
		return "";
	}
}
