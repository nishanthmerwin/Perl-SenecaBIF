use strict;
use warnings;


# Array exercises:
# Q1a:
# Store all the months of the year in an array
# variable called "months".

my @months = qw/January February March April May June July August September October November December/;


# Q1b:
# Display all the months on the screen each separated by a space.

print "@months\n";


# Q1c:
# Display only the second, fifth, and tenth month
# to the screen each separated by a single space.

print "@months[2,5,10]\n";

# Q1d:
# Display the months on the screen backwards.

my @monthRev = reverse @months;
print "@monthRev\n";

# Q1e:
# Display the number of elements contained in the
# array "months".

print scalar @months;

print "\n";


# Q1f:
# Add the element "new-year" to the months array.

push(@months,"new-year");


# Q1g:
# Sort and display the array in alphabetical order.

my @sort = sort(@months);

print "@sort\n";

# Q2a:
# Create an array which contains the numbers 0 to 999.

my @numList = (0 .. 999);


# Q2b:
# Display ONLY the first number, the values from index 100 to 120, and the
# last number each separated by a space to the screen on a single line
# using a single print statement!

print "@numList[0,100 .. 120, -1]\n";

# Q2c:
# Remove the last element from the array.

pop(@numList);

# Q2d:
# Sort this array in ascending numerical order from 0 to 998.

@numList = sort { $a <=> $b } @numList;

print "@numList\n";

