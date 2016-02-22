use strict;
use warnings;


my($DNA,$i,$letter,%translate,$RNA,@codons,@amino,$prot,$protlen,$codchunk,$rownum,$protrow,$spaces,@protein,@row,$val,$row,$weight);



my $filename = $ARGV[0];

use File::Slurp;
$DNA = read_file($filename);



## This version reads from a file that the user specifies. Works best if it is a fasta file.
# use File::Slurp;

# $DNA = read_file($ARGV[0]);

# $DNA =~ s/[\n\r\s]+//g;

# chomp($DNA = uc($DNA));


# Filter out letters that don't belong to ACTG, put into new string called $DNA
for($i = 0; $i < length($DNA); $i++){
	$letter = substr($DNA,$i,1);
	unless($letter eq "A" | $letter eq "C" | $letter eq "T" | $letter eq "G"){
		substr($DNA,$i,1,"");
		$i--;
	}
}


# Conditional, if DNA string is less than 3 base pairs.
$weight=0;
if(length($DNA)<3){
	print " "x9,"0\n";
	for($i=0; $i<length($DNA);$i++){
		$letter = substr($DNA,$i,1);
		if($letter eq "A"){
			$weight += 135.13;
		}
		elsif($letter eq "T"){
			$weight += 126.10;
		}
		elsif($letter eq "C"){
			$weight += 111.10;
		}
		elsif($letter eq "G"){
			$weight += 1150.12;
		}
	}
	printf("%.4f", $weight);
	exit;
}



# Convert $DNA to $RNA

$RNA = $DNA;
for($i = 0; $i < length($RNA); $i++){
	$letter = substr($DNA,$i,1);
	if($letter eq "A"){
		substr($RNA,$i,1,"U");
	}
	elsif($letter eq "T"){
		substr($RNA,$i,1,"A");
	}
	elsif($letter eq "C"){
		substr($RNA,$i,1,"G");
	}
	elsif($letter eq "G"){
		substr($RNA,$i,1,"C");
	}
}


# Create hash table of codons(keys) to amino acids(values)
@codons = qw/UUU UUC UUA UUG CUU CUC CUA CUG AUU AUC AUA AUG GUU GUC GUA GUG UCU UCC UCA UCG CCU CCC CCA CCG ACU ACC ACA ACG GCU GCC GCA GCG UAU UAC UAA UAG CAU CAC CAA CAG AAU AAC AAA AAG GAU GAC GAA GAG UGU UGC UGA UGG CGU CGC CGA CGG AGU AGC AGA AGG GGU GGC GGA GGG/;
@amino = qw/F F L L L L L L I I I M V V V V S S S S P P P P T T T T A A A A Y Y * * H H Q Q N N K K D D E E C C * W R R R R S S R R G G G G/;
@translate{@codons}=@amino;


# Coverts $RNA to $prot using %translate hash table
$protlen = int(length($RNA)/3);
$prot = "";
for($i = 0 ; $i<$protlen ; $i++){
	$codchunk = substr($RNA,$i*3,3);
	if(length($codchunk)==3){
		substr($prot,$i,0,$translate{$codchunk});
	}
}


# Converts string into array with each amino acid as a separate string. Adds empty space at the end.
@protein = split("",$prot);
while(scalar @protein % 60){
	push(@protein," ")
}


# How many rows?
$rownum = int((scalar @protein)/60);




# Prints the FASTA format
for($i=0; $i < $rownum; $i++){
	
	#Subsets row into single string
	@row = ($i*60..(($i+1)*60-1));
	$protrow = join("",@protein[@row]);
	
	# Adds spaces inbetween.
	if(length($protrow) >10 ){
	substr($protrow,10,0," ");
	}
	if(length($protrow) >21 ){
	substr($protrow,21,0," ");
	}
	if(length($protrow) >32 ){
	substr($protrow,32,0," ");
	}
	if(length($protrow) >43 ){
	substr($protrow,43,0," ");
	}
	if(length($protrow) > 54 ){
	substr($protrow,54,0," ");
	}
	
	#Prints the row with the given spaces and sequence number value
	$val = $i*60 + 1;
	$spaces = 10 - length($val);
	print " "x$spaces,$val," ",$protrow, "\n";
}



# Calculate molecular weight of valid DNA string

for($i=0; $i<length($DNA);$i++){
	$letter = substr($DNA,$i,1);
	if($letter eq "A"){
		$weight += 135.13;
	}
	elsif($letter eq "T"){
		$weight += 126.10;
	}
	elsif($letter eq "C"){
		$weight += 111.10;
	}
	elsif($letter eq "G"){
		$weight += 150.12;
	}
}
printf("%.4f", $weight);























