

use strict;
use warnings;

my ($original,@damaged);


$original = "ATCGTTACGG";
			
@damaged = ("2XC3G2","","","2XC2XG2","XXXXXXXXXX","X1GXAAXGX1");


foreach(@damaged){
	repairDNA($original,\$_);
	print "$_\n";
}


sub repairDNA{
	my $original = shift(@_);
	my $rDamage = shift(@_);
	$original =~ tr/ATCG/TAGC/;
	${$rDamage} =~ tr/ATCG/TAGC/;
	my $replace;
	while(${$rDamage} =~ m/([1-9])/g){
		$replace = substr($original,$-[0],$1);
		substr(${$rDamage},$-[0],1,$replace);
	}
	if(${$rDamage} eq ""){
		${$rDamage} = $original;
	}
}