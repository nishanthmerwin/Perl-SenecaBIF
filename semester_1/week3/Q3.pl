use strict;
use warnings;

# Ask for input
print "Enter how far into the series you want to calculate pi: \n";
chomp(my $input = <STDIN>);

my ($pi,$neg);

$neg = (-1);

my $start_time=time();
# For loop from 1, till the user input
for(my $i=1; $i<= $input; $i++ ){
	# Without an if loop!
	$pi += (4 / (2 * $i -1))*($neg**($i+1));
}
# Print results
print "WITHOUT IF:The value of pi according to the arithmetic series to $input is:\n";
printf "pi is %.10f\n", $pi;
my $end_time=time();

my $runtime1 = $end_time - $start_time;
print "It takes $runtime1 to do this in a for loop\n";


my $start_time2=time();
$pi = 0;

# For loop from 1, till the user input
for(my $i=1; $i<= $input; $i++ ){
	# If statements test for odd/even, then add/subtract the respective value
	if($i % 2 == 0){
		$pi -= 4 / (2 * $i -1);
	}
	else{	
		$pi += 4 / (2 * $i -1);	
	}
}

# Print results
print "WITH IF STATEMENT:The value of pi according to the arithmetic series to $input is:\n";
printf "pi is %.10f\n", $pi;
my $end_time2=time();
my $runtime2 = $end_time2 - $start_time2;
print "It takes $runtime2 to do this with if statements in a for loop\n";

print time();