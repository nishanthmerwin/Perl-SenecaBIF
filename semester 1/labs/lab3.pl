#!/Strawberry/perl/bin/perl

use strict;
use warnings;



# my $strA = "AC";
# my $strB = "AC";

my $strA = "ACTGATTCA";
my $strB = "ACGCATCA";


# Gap Penalty
my $gapPen=-2;


my $ref = " ACGT";

# ID Scoring Matrix
my @PAM250 = (	[ " ","A","C","G","T"],
				["A" ,  1,  0,  0,  0],
				["C" ,  0,  1,  0,  0],
                ["G" ,  0,  0,  1,  0],
				["T" ,  0,  0,  0,  1]);
				
# Prints the results of the NW score in a table
my @score = ();


push(@{$score[0]},0);
for(my $j=1; $j <= length($strA); $j++){
	push(@{$score[0]},$j * $gapPen);
}
for(my $i=1; $i <= length($strB); $i++){
	push(@{$score[$i]},$i * $gapPen);
}



## 2D Array Stuff

my ($i,$j,$letterA, $letterB,$matchVal,@threeVal,$upVal,$leftVal);

for($i=1; $i <= length($strB); $i++){
	for($j=1; $j <= length($strA); $j++){
		
		
		# Figure out the match value
		$letterA = substr($strA,$j-1,1);
		$letterB = substr($strB,$i-1,1);
	
		
		if($letterA eq $letterB){
			$matchVal=$score[$i-1][$j-1] + 1;
		}
		else{
			$matchVal=$score[$i-1][$j-1] - 1;
		}
		# Figure out the top gap value
		$upVal = $score[$i-1][$j] + $gapPen;
		
		# Figure out the left gap value
		$leftVal = $score[$i][$j-1] + $gapPen;
		@threeVal = ($matchVal,$upVal,$leftVal);
	
		
		@threeVal = sort { $b <=> $a }@threeVal;
		$score[$i][$j]= $threeVal[0];
	}
}

foreach(@score){
	print "@{$_}","\n";
}

my $alignScore = $score[-1][-1];

print $alignScore;









print "\n\n\n\n\n\n";




my $scoreRef  = \@score;

traceBack($scoreRef);


sub traceBack($){

	my @scoreRef = @{@_[0]};
	
	
	for(my $i=scalar(@scoreRef); $i <= 0; $i--){
		for(my $j=scalar(@scoreRef[1]); $j <= 0; $j--){
			splice(@scoreRef[$i],-1,1);
		}
	}
	
	my $scoreRef  = \@scoreRef;
	
	
	if(scalar(@scoreRef) > 0){
		traceBack($scoreRef);
	}
		
	foreach(@scoreRef){
		print "@{$_}\n";
	}
	
}















