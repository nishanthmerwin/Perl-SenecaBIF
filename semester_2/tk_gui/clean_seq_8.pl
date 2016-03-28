#!/usr/bin/perl
use warnings;
use strict;
use utf8;


# Import the tk package
use Tk;


# Creates a new object which is the main window 
my $w = MainWindow->new;


# Setting the size of the window in pixels
$w->geometry("650x100");

# Adds a title for the window
$w->title("Clean Sequence");


$w->configure(-bg=>'black',-fg=>'white');


# Fram contains all of the different components 
my $frame1 = $w->Frame(-bg=>'black')->pack(-side=>'top', -expand=>'1', -fill=>'both');

# Adds a text entry box within the frame
$frame1->Label(-text => "Original Sequence",-bg=>'black',-fg=>'white')->pack(-side => 'left');

# Retreives the information from thee entry box
my $old_seq = $frame1->Entry(-width => '20', -relief => 'sunken')->pack(-side => 'left');

# Adds an entry button and saves its state in $button 
my $button = $frame1->Button(-text => "Clean Up", -command=> \&clean_up)->pack(-side => "left");

# Adds a second text field
$frame1->Label(-text => "New Sequence")->pack(-side => 'left');
my $new_seq = $frame1->Entry(-width => '20', -relief => 'sunken')->pack(-side => 'left');

# Makes sure its not editable
$new_seq->configure(-state=>'disabled');

# Makes a reset button
my $reset_button = $frame1->Button(-text=> "Reset", -command=>\&reset)->pack(-side=>'left');


# Runs the main loop of the program. Required for all tk programs 
MainLoop();

# Resets all of the fields
sub reset {

	my $out = $frame1->messageBox(-message=>"Are you sure you want to delete everything?",-title=>'Reset', -type=>'yesnocancel', -icon=>'warning');

	if($out eq 'Yes'){	
		# Delets the old sequence
		$old_seq->delete(0,'end');
		# Deletes the new sequence (requires it to be editable)
		$new_seq->configure(-state=>'normal');
		$new_seq->delete(0,'end');
		$new_seq->configure(-state=>'disabled');
	}
}

# Kinda cheats by retrieving $old_seq directly from above, not actually being passed into the subroutine
sub clean_up {
	# read from text box
	my $seq = $old_seq->get();
	# Converts any non ACTG to X
	$seq =~ s/[^acgt]/☹/ig;
	# set so text can be entered
	$new_seq->configure(-state=>'normal');
	# Deletes the current contents
	$new_seq->delete(0,'end');
	# inserts the new sequence
	$new_seq->insert('end',$seq);	
	# Sets it back to read-only
	$new_seq->configure(-state=>'disabled');

	stats();
}


# Prints out certain statistics of the original sequence
sub stats{
	my $seq = $old_seq->get();
	my $other = $seq =~ s/([^ACTG])/$1/ig;
	my $A = ($seq =~ s/([A])/$1/ig) || 0;
	my $C = ($seq =~ s/([C])/$1/ig) || 0;
	my $G = ($seq =~ s/([G])/$1/ig) || 0;
	my $T = ($seq =~ s/([T])/$1/ig) || 0;

	unless($other){
		$other = 0;
	}
	my $output = "Number of invalid characters: $other\nNumber of A: $A\nNumber of C: $C\nNumber of G: $G\nNumber of T: $T\n";
	$frame1->messageBox(-message=>$output,'title'=>'Clean Up',-icon=>'info');
}

