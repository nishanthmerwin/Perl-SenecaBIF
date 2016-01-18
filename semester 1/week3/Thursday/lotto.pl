

# program: lotto.pl
# author:  Nishanth and Danny Abesdris
# date:    sept. 24, 2015
# purpose: to write a Perl program to simulate the drawing of random numbers for the lottoMAX lottery draw.
#		   Chooses a unique set of 7 numbers 1 to 49.


use warnings;
use strict;

my @winningNums = ( );

my $cols = 7;

my $randNum;
my $k = 1;

my @winners = ( );

while($k==1){
	for(my $i=0; $i<$cols; $i++){
		$randNum = int(rand(49) + 1);
		push(@winningNums,$randNum);
	}

	@winners = sort {$a <=> $b} @winningNums;
	for(my $j=0; $j<$cols; $j++){
			if($winners[$j]==$winners[$j]){
			$k = 1;
			}
			else{
			$k=0;
			}
		}
}

print "@winners";