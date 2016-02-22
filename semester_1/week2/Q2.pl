# This allows people to enter in values for mass of two objects, its distance and assumes a gravitational constant
use strict;
use warnings;

# F=(G * m1 * m2) / R^2
# F = force; G = gravitational constant; m1 = mass of object 1; m2 = mass of object 2; R= distance in m

my $earth = 5.9742 * 10 **24;
my $moon = 7.46 * 10 **22;
my $emdist = 385000;

# Assigns a gravitational constant
my $G = 6.67 * 10**(-11);

print "This program lets you determine the attractive force between objects!\n";

print "Enter the mass of object 1 (in kilograms):\n";
my $m1 = <STDIN>;
chomp($m1);

print "Enter the mass of object 2 (in kilograms):\n";
my $m2 = <STDIN>;
chomp($m2);

print "Enter the distance between your objects (in kilometers):\n";
my $R = <STDIN>;
chomp($m2);
my $r = $R * 1000;

# Solves for the force using the inputted variables
my $F = ($G * $m1 * $m2)/($R ** 2);

print "The attractive force between your two objects is $F Newtons";