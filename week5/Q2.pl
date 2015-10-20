# Q2 (Challenge Question).
# Write a Perl program that first populates an array with 100,000 random whole
# numbers ranging from 1 to 1,000,000 inclusive. After filling your array, your program then
# sorts all the values numerically and stores the sorted list back in the original array.
# Second, write the code for 2 Perl subroutines: 1. linearSearch( ) and 2. binarySearch( ).
# Both subroutines accept the entire sorted array of numbers as their ONLY parameter.
# The subroutines then asks the user to enter a search value (KEY) (any whole number from 1 to 1,000,000).
# The linearSearch( ) subroutine, simply starts from the beginning of the list,
# stops when it finds the KEY or reaches the end of the list, and returns the total number
# of searches required to find the value or the value -1 if it could not find the KEY.
#
# The binarySearch subroutine begins by comparing the target value (KEY) to the value of
# the middle element of the sorted array. If the target value is equal to the middle
# element's value, then the KEY is found and the search is finished.
# If the KEY is less than the middle element's value, then the search continues on the lower
# half of the array; or if the target value is greater than the middle element's value,
# then the search continues on the upper half of the array. This process continues,
# eliminating half of the elements, and comparing the KEY to the value of the middle
# value of the remaining elements - until the target value is either found
# or until the entire array has been searched.
# The binarySearch( ) subroutine returns the total number of searches required to find the
# KEY or else the value -1 if the KEY could not be found.
# NOTE: For this algorithm, your solution must keep track of HIGH, LOW, and MIDDLE elements
#       within the list and these values may continually change as the algorithm proceeds
#       towards completion.


use strict;
use warnings;

# Create 100 thousand random numbers ranging from 1 to 1,000,000
my ($i,@random);
for($i=0; $i <= 100000; $i++){
	push(@random,int(rand(1000000))+1); 
}
@random = sort {$a <=> $b} @random;


## Define linear search subroutine

sub linearSearch(@){
	my ($j,$found,$input);
	
	print "What value would you like to search for?";
	chomp($input = <STDIN>);
	
	$found=0;
	for($j=0; $j<100000 && $found==0; $j++){
		if($_[$j]==$input){
			$found=1;
		}
	}
	if($found==0){
		return(-1);
	}
	else{
		return($j-1)
	}
}


## Define binary search subroutine
print $random[1], "\n";
sub binarySearch(@){
	my ($j,$found,$input,$length,@randomTest,$middle);
	
	print "What value would you like to search for?";
	chomp($input = <STDIN>);
	
	@randomTest = @_;

	$found=0;
	$j=0;
	
	
	# splice ARRAY, OFFSET, LENGTH, LIST
	
	while(scalar(@randomTest) > 0 && $found ==0){	
		$middle = int(scalar(@randomTest)/2);
		if($randomTest[$middle] == $input){
			$found=1;
		}
		elsif($randomTest[$middle] < $input){
			splice(@randomTest,0,$middle);
		}
		elsif($randomTest[$middle] > $input){
			splice(@randomTest,$middle,$middle);
		}
		if(scalar(@randomTest)==2){
			if($randomTest[0]==$input){
				$found=1;
			}
			if($randomTest[1]==$input){
				$found=1;
			}
			@randomTest = ();
		}
		$j += 1;
	}
	if($found==0){
		return(-1);
	}
	else{
		return($j)
	}
}


my $binary = (binarySearch(@random));
my $linear = (linearSearch(@random));

print "Binary search only requires $binary loops, while linear search requires $linear loops.";

exit;
