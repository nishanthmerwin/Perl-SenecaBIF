use strict;
use warnings;






my ($str,@array,$rand,$out,$file);

$str = "ABC/xyz/Hello World/--ok to go--/5 prime to 3 prime/Watson & Crick";


@array = split("/",$str);



$rand = int(rand($#array+1));


$out = $array[$rand];


$file = "quotes.dat";




# Appends to file or creates the file if it doesn't exist
sub writeQuote($){
	open(IN, ">> $file") || die("Error opening file: $file... Message: $!\n");
		print IN "@_\n";
	close(IN);
	
	print @_;
}

writeQuote($out);