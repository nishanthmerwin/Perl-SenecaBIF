# Q1.
# Write a PERL program that asks the user to enter
# a positive whole number greater than or equal to 2,
# and determines if that number is a prime number.
# Your program should invoke a user-defined function called isPrime( )
# that accepts the user data and returns a true value if the number is a
# prime number or a false value otherwise.
# Recall: A prime number is only evenly divisible by
#         1 and itself.
# HINT: Use the modulus operator (%) repeatedly on the
#       entered value to determine if there are any
#       numbers which do not return a remainder.

use strict;
use warnings;


# Determine if it is a prime number, create the subroutine.
sub isPrime($) {
	my ($i,$num,$mul);
	$num = shift(@_);
	$mul = 0;
	for($i=2; $i < $num && $mul==0; $i++){
		if($num % $i == 0){
			$mul=1;
		}
	}
	return($mul);
}


print "Enter a number, let's see if it's a prime number!\n";
chomp(my $input = <STDIN>);

if(isPrime($input)==0){
	print "Woooo.. you got a prime number!";
}
else{
	print "Nope, try again.";
}