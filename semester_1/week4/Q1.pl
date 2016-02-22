use strict;
use warnings;


# Practice and Challenge questions:
# Q1.
# Write the code for a Perl program that asks the user how many rows of
# an isoscelles triangle they wish to display (a positive whole number) and then
# draws the triangle on the screen. Each row of the triangle is displayed as
# * characters and each subsequent row contains 2 more asterisks '*' than the
# previous row!
# For example, if the user entered 5 for rows, your program would display:
#
#     *
#    ***
#   *****
#  *******
# *********

# For example, if the user entered 8 for rows, your program would display:
#
#        *
#       ***
#      *****
#     *******
#    *********
#   ***********
#  *************
# ***************


print "How many rows would you like in your isocoles triangle?\n";
chomp(my $input = <STDIN>);


print "\n\nYou asked for $input rows, here they are:\n\n";

for(my $i =1; $i <= $input; $i++){
	my $space = (" "x($input-$i));
	print $space, ("*"x($i*2-1)),"\n";
}

