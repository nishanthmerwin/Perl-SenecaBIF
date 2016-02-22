use strict;
use warnings;


# Test program for amino acid chart

my($DNA,$i,$letter,%translate,$RNA,@codons,@amino,$prot,$protlen,$codchunk,$rownum,$protrow,$spaces,@protein,@row,$val,$weight);


$DNA = uc("________1_caatgttcaa_acactttgtg_aagctctgtt_agctgatggt_cttgctaaag_catttcctag" .
"XXXXXXXXXXXXXXXX");


# Filter out letters that don't belong to ACTG, put into new string called $DNA
for($i = 0; $i < length($DNA); $i++){
	$letter = substr($DNA,$i,1);
	unless($letter eq "A" | $letter eq "C" | $letter eq "T" | $letter eq "G"){
		substr($DNA,$i,1,"");
		$i--;
	}
}


#Convert $DNA to $RNA
$RNA = $DNA;


%translate = (
  TTT => "F", TTC => "F", TTA => "L", TTG => "L",
  TCT => "S", TCC => "S", TCA => "S", TCG => "S",
  TAT => "Y", TAC => "Y", TAA => "STOP", TAG => "STOP",
  TGT => "C", TGC => "C", TGA => "STOP", TGG => "W",
  CTT => "L", CTC => "L", CTA => "L", CTG => "L",
  CCT => "P", CCC => "P", CCA => "P", CCG => "P",
  CAT => "H", CAC => "H", CAA => "Q", CAG => "Q",
  CGT => "R", CGC => "R", CGA => "R", CGG => "R",
  ATT => "I", ATC => "I", ATA => "I", ATG => "M",
  ACT => "T", ACC => "T", ACA => "T", ACG => "T",
  AAT => "N", AAC => "N", AAA => "K", AAG => "K",
  AGT => "S", AGC => "S", AGA => "R", AGG => "R",
  GTT => "V", GTC => "V", GTA => "V", GTG => "V",
  GCT => "A", GCC => "A", GCA => "A", GCG => "A",
  GAT => "D", GAC => "D", GAA => "E", GAG => "E",
  GGT => "G", GGC => "G", GGA => "G", GGG => "G",
); # this is the hash table for the amino acids



# Create hash table of codons(keys) to amino acids(values)
# @codons = qw/UUU UUC UUA UUG CUU CUC CUA CUG AUU AUC AUA AUG GUU GUC GUA GUG UCU UCC UCA UCG CCU CCC CCA CCG ACU ACC ACA ACG GCU GCC GCA GCG UAU UAC UAA UAG CAU CAC CAA CAG AAU AAC AAA AAG GAU GAC GAA GAG UGU UGC UGA UGG CGU CGC CGA CGG AGU AGC AGA AGG GGU GGC GGA GGG/;
# @amino = qw/F F L L L L L L I I I M V V V V S S S S P P P P T T T T A A A A Y Y * * H H Q Q N N K K D D E E C C * W R R R R S S R R G G G G/;
# @translate{@codons}=@amino;




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
$rownum = int($protlen/60);

# Prints the correc format one row at a time.
for($i=0; $i <= $rownum; $i++){
	
	#Subsets row into single string
	@row = ($i*60..(($i+1)*60-1));
	$protrow = join("",@protein[@row]);
	
	# Adds spaces inbetween.
	substr($protrow,10,0," ");
	substr($protrow,21,0," ");
	substr($protrow,32,0," ");
	substr($protrow,43,0," ");
	substr($protrow,54,0," ");
	

	#Prints the row with the given spaces and sequence number value
	$val = $i*60 + 1;
	# Could also be done with a printf("%10d",$val) formatted print statement.
	$spaces = 10 - length($val);
	print " "x$spaces,$val," ",$protrow, "\n";
}