#!/usr/bin/perl
use warnings;
use strict;
#
use Tk;
# 
my $w = MainWindow->new;
#
$w->geometry();
#
$w->title("");
# 
my $frame1 = $w->Frame()->pack(-side=>'top');
#
my $old_seq = $frame1->Entry(-width => '0', -relief => 'sunken')->pack(-side => 'left');
# 
$frame1->Label(-text => "")->pack(-side => 'left');
# 
my $button = $frame1->Button(-text => "")->pack(-side => "left");
# 
MainLoop();
