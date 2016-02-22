use strict;
use warnings;



my @val = (5,4,3,2,1);


my $len = scalar @val;

print "$len \n";


print "$val[0]\n";
print "$val[1]\n";
print "$val[2]\n";
print "$val[3]\n";
print "$val[4]\n";



$val[$len+1] = 1;

for (my $i = 0; $i < $len ; $i++){
	
		$val[$i+1] = $val[$i] * $val[$i+1];
	
	}
	
	
print "$val[0]\n";
print "$val[1]\n";
print "$val[2]\n";
print "$val[3]\n";
print "$val[4]\n";