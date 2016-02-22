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