#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

print "Do you work part-time<y/n>? ";
chomp(my $ans = <STDIN>);

if ($ans eq 'y') {print "Working hard. Good for you!\n";}
else {print "You may want to consider a part-time job.\n";}

