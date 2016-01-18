



$scoreRef  = \@score;



sub traceBack($){

	my @scoreRef = @{@_[0]};
	
	foreach(@scoreRef){
		print "@{$_}\n";
	}
}