# Q4.
# Store the following key/value pairs in a hash-table:
# A / "Adenine"
# T / "Thymine"
# C / "Cytosine"
# G / "Guanine"
# U / "Uracil"
#
# Use the keys( ) function to display all of
# the hash's keys. Use the values( ) function to
# display all of the hash's values.
#
# Write a program that asks the user to enter
# a key value, and displays the value for that
# key if it is found within the hash or the text:
# "Cannot find entry for '?' if the key is not found.

use strict;
use warnings;


my %bases = (A=> 'Adenine', T => 'Thymine', C => 'Cytosine', G => 'Guanine', U => 'Uracil');

my @keys = keys %bases;
my @values = values %bases;


print "For the following keys:\n@keys\nThese are the corresponding values:\n@values\n","\n\n********************************************\n\n";


print "Enter a key value, and I'll find the nucleotide that matches!\n";
chomp(my $input = uc(<STDIN>));

print "\n", "$input corresponds to $bases{$input}.";