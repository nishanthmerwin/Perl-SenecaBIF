## This program calculates the area of a circle and the volume of the sphere with a given radius
use strict;
use warnings;

print "Enter the radius of the circle: ";
my $radius = <STDIN>;
chomp($radius);
my $area = $radius ** 2 * 3.14195;
my $volume = $radius ** 3 * 4/3 * 3.14194;

print "For a given radius: $radius\nThe area of the circle is $area, the volume of the sphere is $volume\n";

print "Now, let's calculate the volume of a cylinder with the radius=$radius.\nEnter the height of the cylinder:";

my $height = <STDIN>;
chomp($height);
my $volcyl = 4/3 * 3.14195 * $radius **3;
print "The volume of the cylinder is $volcyl.";
exit;


