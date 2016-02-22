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

my %bases = (A => "Adenine", T => "Thymine", C => "Cytosine", G => "Guanine", U => "Uracil");
my $input;


print "Here are the keys of the hash table.\n";
print keys(%bases);

print "\nHere are the values of the hash table.\n";
print values(%bases);

print "\n", "Enter a key that you'd like to search for";

chomp($input = <STDIN>);

if($bases{$input}){
	print "$input corresponds to $bases{$input}";
}
else{
	print "Could not find '$input' within the hash table." 
}