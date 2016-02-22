use strict;
use warnings;

# Ask for input
print "Enter a value in cents: \n";
chomp(my $cents=<STDIN>);

# Declare variables to zero
my $toonies=0;
my $loonies=0;
my $quarters=0;
my $dimes=0;
my $nickels=0;
my $pennies=0;

print "$cents cents is :\n";

# Test for each coin
if($cents >= 200){
	$toonies = int($cents / 200);
	$cents -= 200*$toonies;
}
if($cents >= 100){
	$loonies = int($cents / 100);
	$cents -= 100*$loonies;
}
if($cents >= 25){
	$quarters = int($cents / 25);
	$cents -= 25*$quarters;
}
if($cents >= 10){
	$dimes = int($cents / 10);
	$cents -= 10*$dimes;
}
if($cents >= 5){
	$nickels = int($cents / 5);
	$cents -= 5*$nickels;
}
if($cents >= 1){
	$pennies = int($cents / 1);
	$cents -= 1*$pennies;
}

# Print results
print "$toonies toonies\n"; 
print"$loonies loonies\n"; 
print"$quarters quarters\n"; 
print"$dimes dimes\n"; 
print"$nickels nickels\n"; 
print"$pennies pennies\n";

my $sum = $toonies + $loonies + $quarters + $dimes + $nickels + $pennies;

print "Only used $sum coins!\n"







