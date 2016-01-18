#!/Strawberry/perl/bin/perl


use strict;
use warnings;

my $human = <<"_END_";     
	1 acatttgctt ctgacacaac tgtgttcact agcaacctca aacagacacc atggtgcatc
       61 tgactcctga ggagaagtct gccgttactg ccctgtgggg caaggtgaac gtggatgaag
      121 ttggtggtga ggccctgggc aggctgctgg tggtctaccc ttggacccag aggttctttg
      181 agtcctttgg ggatctgtcc actcctgatg ctgttatggg caaccctaag gtgaaggctc
      241 atggcaagaa agtgctcggt gcctttagtg atggcctggc tcacctggac aacctcaagg
      301 gcacctttgc cacactgagt gagctgcact gtgacaagct gcacgtggat cctgagaact
      361 tcaggctcct gggcaacgtg ctggtctgtg tgctggccca tcactttggc aaagaattca
      421 ccccaccagt gcaggctgcc tatcagaaag tggtggctgg tgtggctaat gccctggccc
      481 acaagtatca ctaagctcgc tttcttgctg tccaatttct attaaaggtt cctttgttcc
      541 ctaagtccaa ctactaaact gggggatatt atgaagggcc ttgagcatct ggattctgcc
      601 taataaaaaa catttatttt cattgc
_END_

my $chimp = <<"_END_";
	1 acacttgctt ctgacacaac tgtgttcacg agcaacctca aacagacacc atggtgcatc
       61 tgactcctga ggagaagaat gccgtcacca ccctgtgggg caaggtgaac gtggatgaag
      121 ttggtggtga ggccctgggc aggctgctgg tggtctaccc ttggacccag aggttctttg
      181 agtcctttgg ggatctgtcc tctcctgatg ctgttatggg caaccctaag gtgaaggctc
      241 atggcaagaa agtgcttggt gcctttagtg atggcctgaa tcacctggac aacctcaagg
      301 gtacctttgc ccagctcagt gagctgcact gtgacaagct gcatgtggat cctgagaact
      361 tcaagctcct gggcaacgtg ctggtgtgtg tgctggccca tcactttggc aaagaattca
      421 ccccgcaagt gcaggctgcc tatcagaaag tggtggctgg tgtggctaat gccctggccc
      481 acaagtacca ctaagctcac tttcttgctg tccaatttct accaaaggtt cctttgttcc
      541 caaagtccaa ctactgaact gggggatatt atgaagggcc ttgaggatct ggattctgcc
      601 taat
_END_







# Removes everything 
$human =~ s/[^atcg]//g;
$chimp =~ s/[^atcg]//g;

my $matchCount=0;
# Calculate percent ID
for(my $i=0; $i < length($chimp); $i++){
	if (substr($chimp,$i,1) eq substr($human,$i,1)){
		$matchCount++;
	}
}





$human =~ tr/atcg/uagc/;
$chimp =~ tr/atcg/uagc/;


# Amino acid hash table
my %amino = 
   ( AAA=>"K", AAG=>"K",
     GAA=>"E", GAG=>"E",
     AAC=>"N", AAU=>"N",
     GAC=>"D", GAU=>"D",
     ACA=>"T", ACC=>"T", ACG=>"T", ACU=>"T", 
     GCA=>"A", GCC=>"A", GCG=>"A", GCU=>"A",
     GGA=>"G", GGC=>"G", GGG=>"G", GGU=>"G",
     GUA=>"V", GUC=>"V", GUG=>"V", GUU=>"V",
     AUG=>"M",
     UAA=>"*", UAG=>"*", UGA=>"*",
     AUC=>"I", AUU=>"I", AUA=>"I",
     UAC=>"Y", UAU=>"Y",
     CAA=>"Q", CAG=>"Q",
     AGC=>"S", AGU=>"S",
     UCA=>"S", UCC=>"S", UCG=>"S", UCU=>"S",
     CAC=>"H", CAU=>"H",
     UGC=>"C", UGU=>"C",
     CCA=>"P", CCC=>"P", CCG=>"P", CCU=>"P",
     UGG=>"W",
     AGA=>"R", AGG=>"R",
     CGA=>"R", CGC=>"R", CGG=>"R", CGU=>"R",
     UUA=>"L", UUG=>"L", CUA=>"L", CUC=>"L", CUG=>"L", CUU=>"L",
     UUC=>"F", UUU=>"F"
   );
   
$human = uc($human);
$chimp = uc($chimp);


# Splites RNA into codons
my (@humanProt,@chimpProt);
for(my $i=0; $i < length($human); $i = $i + 3){
	push(@humanProt,substr($human,$i,3));
}
for(my $i=0; $i < length($chimp); $i = $i + 3){
	push(@chimpProt,substr($chimp,$i,3));
}


## Convert full RNA codons to amino acids
for(my $i=0; $i<scalar(@humanProt); $i++){
	if(length($humanProt[$i])<3){
		splice(@humanProt,$i,1);
		$i--;
	}
	else{
		$humanProt[$i] = $amino{$humanProt[$i]};
	}
}
for(my $i=0; $i<scalar(@chimpProt); $i++){
	if(length($chimpProt[$i])<3){
		splice(@chimpProt,$i,1);
		$i--;
	}
	else{
		$chimpProt[$i] = $amino{$chimpProt[$i]};
	}
}

# Creates the blank 2D array with axis labels.

my @output = ();
push(@{$output[0]}," ");

for(my $j=1; $j<scalar(@humanProt); $j++){
	push(@{$output[0]}, $humanProt[$j-1])
}
for(my $i=1; $i<scalar(@chimpProt); $i++){
	push(@{$output[$i]}, $chimpProt[$i-1])
}


# Fills in the 2D array (For each cell, not just the diagonal)
# for(my $i=1; $i<scalar(@chimpProt); $i++){
	# for(my $j=1; $j<scalar(@humanProt); $j++){
		
		# if($chimpProt[$i-1] eq $humanProt[$j-1]){
			# push(@{$output[$i]}, "X");
		# }
		# else{
			# push(@{$output[$i]}, " ");
		# }
	
	
	# }
# }

my $spaceBefore;
my $spaceAfter;
# Fills in the 2D array (for just the diagonal, fills in spaces everywhere else)
for(my $i=1; $i<scalar(@chimpProt); $i++){
	if($chimpProt[$i-1] eq $humanProt[$i-1]){
			$spaceBefore = $i-1;
			$spaceAfter = scalar(@humanProt)-$i-1;
			push(@{$output[$i]}, " " x $spaceBefore);
			push(@{$output[$i]}, "X");
			push(@{$output[$i]}, " " x $spaceAfter);
		}
	else{
		push(@{$output[$i]}, " " x $spaceBefore);
		push(@{$output[$i]}," ");
		push(@{$output[$i]}, " " x $spaceAfter);
	}
}




my $percentID = $matchCount/length($human)*100;




# Prints the 2D array
foreach(@output){
	print @{$_},"\n";	
}


print("percent identity: ",sprintf("%.4f",$percentID));




