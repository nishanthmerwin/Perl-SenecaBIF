


use strict;
use warnings;

my $file = "MT.fa";


$/ = undef;


open(FD,"< $file");
my 	$mRNA = <FD>;
close(FD);
$/ = "\n";




$mRNA =~ tr/[^ATCG]//cd;

$mRNA =~ tr/T/U/;



my $start;

my $ORF;

my @array;

my $forward=0;
my $reverse=0;


my $count=0;




while($mRNA =~ m/(AUG(?:[AUGC]{3})+?(?:UAA|UAG|UGA))/g){
		$forward++;
}

$mRNA = reverse($mRNA);
$mRNA =~ tr/AUCG/UAGC/;


while($mRNA =~ m/(AUG(?:[AUGC]{3})+?(?:UAA|UAG|UGA))/g){
		$reverse++;
}
print "\n\n\n\n$forward ORFs in the + strand; $reverse ORFs in the - strand.\n\n\n";

exit;


































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
					$forward++;	
					$i = $i + 3*$j;
				}	
			}
		}
	}
}



$mRNA = reverse($mRNA);

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

