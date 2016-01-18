use warnings;
use strict;


my (@cards,$card);


# Defines the two factors of cards, the numerical and suite type
my @ranks = ("A",2..10,"J","Q","K");
my @suite = ("C","S","D","H");


# Creates the deck of cards. First loop is for the suits, next loop is for the numbers
for (my $j=0; $j<4; $j++){
	for (my $i=0; $i < 13; $i++){
		$card = $ranks[$i];
		$card .= $suite[$j];
		push(@cards,$card);
	}
}


my (@draws,$draw,@mem,$rand,$repeat,$check);


# Randomly draws a card from the deck, and "splices" this card from the deck array. Loops 25 times
for($draw=0; $draw<25; $draw++){
	$rand =int(rand(51-$draw));
	push(@draws,$cards[$rand]);
	splice(@cards,$rand,1);
}


my (@curHand,$strHand,@index,$element);

# Outputs the 25 randomly drawn cards in the right format
for(my $rows=0; $rows<5; $rows++){
	@index = (0,1,2,3,4);
	foreach $element(@index){
		$element += $rows*5;
	}
	# Creates an array for each 5 cards drawn
	@curHand = @draws[@index];
	
	# Joins the array with a '-' and then prints
	$strHand = join("-",@curHand);
	print $strHand,"\n";
}