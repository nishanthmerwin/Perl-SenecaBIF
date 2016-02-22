use strict;
use warnings;


# Q2.
# Modify the program you wrote in Question #1 such that instead of the triangle
# being comprised of rows of asterisks '*', each row is made up of the digits 1 through 9
# (However, your program will only display triangles that are between 1 and 9 rows in size (inclusive)).
# For example, if the user entered 5 for rows, your program would display:
#
#     1
#    222
#   33333
#  4444444
# 555555555




print "How many rows would you like in your isocoles triangle?\n";


chomp(my $input = <STDIN>);

if($input <= 9 && $input >= 1){
	for(my $i =1; $i <= $input; $i++){
		my $space = (" "x($input-$i));
		print $space, ($i x($i*2-1)),"\n";
	}
}
else{
	print "Number not valid.";
}