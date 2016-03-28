#!/usr/bin/perl
use warnings;
use strict;

# Import the tk package
use Tk;


# Creates a new object which is the main window 
my $w = MainWindow->new;


# Setting the size of the window in pixels
$w->geometry("650x100");

# Adds a title for the window
$w->title("Clean Sequence");

# Fram contains all of the different components 
my $frame1 = $w->Frame()->pack(-side=>'top');

# Adds a text entry box within the frame
$frame1->Label(-text => "Original Sequence")->pack(-side => 'left');

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
my $reset = $frame1->Button(-text=> "Reset", -command=>\&reset)->pack(-side=>'left');






# Runs the main loop of the program. Required for all tk programs 
MainLoop();


# Resets all of the fields
sub reset {
	
	# Delets the old sequence
	$old_seq->delete(0,'end');
	

	# Deletes the new sequence (requires it to be editable)
	$new_seq->configure(-state=>'normal');
	$new_seq->delete(0,'end');
	$new_seq->configure(-state=>'disabled');
}



# Kinda cheats by retrieving $old_seq directly from above, not actually being passed into the subroutine
sub clean_up {
	# read from text box
	my $seq = $old_seq->get();
	# Converts any non ACTG to X
	$seq =~ s/[^acgt]/X/ig;
	# set so text can be entered
	$new_seq->configure(-state=>'normal');
	# Deletes the current contents
	$new_seq->delete(0,'end');
	# inserts the new sequence
	$new_seq->insert('end',$seq);	
	# Sets it back to read-only
	$new_seq->configure(-state=>'disabled');
}

















