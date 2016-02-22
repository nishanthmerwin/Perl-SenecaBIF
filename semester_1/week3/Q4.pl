use strict;
use warnings;

# Set up a base string and ask for input
my $str = "00000000000000000000000000000000";
print "Enter a positive integer less than 2^32.\n";
chomp(my $test = <STDIN>);
my $pos;

my $input = $test;

# Test if it's a valid number
if($test < 2**32 && $test % 1 == 0){
# Loop through 31 to 0
	for(my $i = 31; $i >=0  ; $i-- ){
		# Test for greater than binary value, if so, convert to 1 and subtract amount for future loops
		if($test >= 2**$i){
			substr $str, $i,1,"1";
			$test -= 2**$i;
		}	
	}
	# Print out results
	my $out = scalar reverse $str;
	substr $out , 8 , 0 , " ";
	substr $out , 17 , 0 , " ";
	substr $out , 26 , 0 , " ";
	print "In binary, $input is:";
	print "\n$out";
}
elsif($test<0){
	print "Number less than zero, enter a positive value";
}
elsif($test>2**32-1){
	print "Number too large for 32 bit conversion."
}




