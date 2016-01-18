# Lecture 3

use strict;
use warnings;



# my $passwd;

# print "Enter user password: ";
# chomp($passwd = <STDIN>);

# if($passwd ne "abc123") {
	# print "Sorry, login NOT permitted...\n";
# }
# else {
	# print "Password validated.. You may continue...\n";
# }


# unless($passwd eq "abc123") {
	# print "Sorry, login NOT permitted...\n";
# }
# else {
	# print "Password validated.. You may continue...\n";
# }


###   This part is testing if and unless with leap years
# my $year;

# print "Enter year to be tested for leap year: \n";
# chomp($year = <STDIN>);

# if((($year % 400) == 0 || ($year % 4)==0) && ($year % 100) != 0) {
	# print "WWOOOO motherfucker $year is a leap year!\n"
# }
# else {
	# print "Fuck dude, $year is not a leap year! :(\n"
# }


# unless ((($year % 400) == 0 || ($year % 4)==0) && ($year % 100) != 0){
	# print "Fuck dude, $year is not a leap year! :(\n"
# }
# else {
	# print "WWOOOO motherfucker $year is a leap year!\n"
# }

# unless((($year % 400) != 0 && ($year % 4)!=0) || ($year % 100) == 0) {
	# print "WWOOOO motherfucker $year is a leap year!\n"
# }
# else {
	# print "Fuck dude, $year is not a leap year! :(\n"
# }





##### Perl operators

# my $num = 7;
# my $result;

# $num++;

# print "num is $num\n";

# my $num = 10;

# my $value = $num > 10 ? 1 : 0;

# print $value;



##### Loops

#### While loop
# my $i = 0;
# print "in the while loop:\n";
# while($i < 100){
	# print "i is $i\n";
	# $i++;
# }
# print "Done the loop!\n";

#### Do loop
# $i = 0;
# do {
	# print "i is $i\n";
	# $i++;
# } while($i < 10);


##### For loops

# print "in the for loop:\n";

# my $i;

# for($i=0; $i < 10 ; $i++){
	# print "i is $i\n";
# }

##### Random numnbers and loops


my $magicNumber = int(rand(10))+1;
my $guesss = 0;
my $input=0;
my $left;
my $guessed;

for(my $guess=0; $guess < 3 && $input != $magicNumber ; $guess++ ){
	print "Guess at the number! (Between 1 and 10)\n";
	chomp($input = <STDIN>);
	if($input == $magicNumber){
		$guessed = $guess + 1;
		print "You got it! It only took you $guessed tries\n";
	}
	elsif($input > $magicNumber){
		$left = 3 - $guess;
		print "You're just a little high, try again, you have $left tries left.\n";
	}
	elsif($input < $magicNumber){
		$left = 3 - $guess;
		print "You're just a little low, try again, you have $left tries left.\n";
	}
	elsif($guess == 3){
		print "You lost mawfucka\nMagic number was $magicNumber.";
	}
}





































