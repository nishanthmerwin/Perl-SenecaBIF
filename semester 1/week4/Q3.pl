use strict;
use warnings;
use Term::ANSIColor;


# Q3 (Challenge Question).
# Modify the program you wrote in Question #2 such that instead of each row of the
# triangle being comprised of the same digit, it is made up of increasing values of
# digits starting from 0 until half of the row is drawn at which point the program
# would display the remainder of the row in decreasing values of digits!
# Your program will only display triangles that are between 1 and 9 rows in size (inclusive).
# For example, if the user entered 7 for rows, your program would display:
#
#       0
#      010
#     01210
#    0123210
#   012343210
#  01234543210
# 0123456543210




print "How many rows would you like in your isocoles triangle?\n";
chomp(my $input = <STDIN>);


print "\n\nYou asked for $input rows, here they are:\n\n";



if($input <= 9 && $input >= 1){
	my $space = (" "x($input));
	print $space,"0\n";
	for(my $i =1; $i <= $input; $i++){
		my $space = (" "x($input-$i));
		my $str = "";
		for(my $j = 0; $j <= $i; $j++){
			$str = $str . $j;
		}
		for(my $j=($i-1); $j >= 0; $j--){
			$str = $str . $j;
		}
		print $space,$str, "\n";
	}
}
else{
	print "Number not valid.";
}
