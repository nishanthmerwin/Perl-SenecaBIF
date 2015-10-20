use warnings;
use strict;


my (@cards,$card);


my @ranks = ("A",2..10,"J","Q","K");

my @suite = ("C","S","D","H");

for (my $j=0; $j<4; $j++){
	for (my $i=0; $i < 13; $i++){
		$card = $ranks[$i];
		$card .= $suite[$j];
		push(@cards,$card);
	}
}


my (@draws,$draw,@mem,$rand,$repeat,$check);

for($draw=0; $draw<25; $draw++){
	$rand =int(rand(51-$draw));
	push(@draws,$cards[$rand]);
	splice(@cards,$rand,1);
}


my (@curHand,$strHand,@index,$element);

for(my $rows=0; $rows<5; $rows++){
	@index = (0,1,2,3,4);
	foreach $element(@index){
		$element += $rows*5;
	}
	@curHand = @draws[@index];
	
	$strHand = join("-",@curHand);
	print $strHand,"\n";
}