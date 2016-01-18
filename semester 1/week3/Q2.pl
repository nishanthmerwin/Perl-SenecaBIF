use strict;
use warnings;
use bigint;

# Ask the user to input value and saves it
print "Enter a number, and the computer will calculate it's factorial!\n";
print "Your number is: ";
chomp(my $input = <STDIN>);

# Creates array that will store the values of input to zero
my @val;

# Length of array
my $len = $input;

# Checks for valid user input
unless($input >1000 || $input < 0 ){
	
	# Fills in array of descending integers
	for (my $i = 0; $i < $input; $i++){
	
		$val[$i] = $input - $i;
	}
	
	# Replaces trailing two scalars in vectors with 1 instead of 0
	$val[$len] = 1;
	$val[$len+1] = 1;
	
	# Multiplies the following string with its previous in a loop
	for (my $i = 0; $i < $len ; $i++){
		$val[$i+1] = $val[$i] * $val[$i+1];
	}
}
else{
	print "Number not valid, try again.\n";
}



print "\nThe value of $input! is:\n";
print $val[$len];



# Calls upon the last value in the array
# Some debate about how to output values.. could be useful to do it in binary?
# my $output = sprintf("%d",$val[$len]);

# print $output;
