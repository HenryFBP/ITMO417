#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Data::Dumper;

print "Henry Post, hpost\@hawk.iit.edu, ITMO 417 at IIT.\n";

=head3 subname

Question 1 (PowerShell Scripting)

Given a PowerShell program shown below, finish the program by completing the function named findOddCount().
The function finds a value in the given list that occurs an odd number of times.

$a1 = (1,1,2,2,3,3,4,4,5,5,6,7,7,7,7)
$a2 = (10,10,7,7,6,6, 2,2,3,3,4,4,5,5,6,7,7,7,7,10,10)
$a3 = (6,6,10,10,7,7,6,6, 2,2,3,3,4,4,5,5,6,7,7,7,7,10,10)
$a4 = (10,10,7,7, 2,2,3,3,4,4,5,5,7,7,7,7,10,10,6)
$a5 = (6,6)
$a6 = (1)

Write-Host -noNewLine "odd value in a1 is "; findOddCount($a1)
Write-Host -noNewLine "odd value in a2 is "; findOddCount($a2)
Write-Host -noNewLine "odd value in a3 is "; findOddCount($a3)
Write-Host -noNewLine "odd value in a4 is "; findOddCount($a4)
Write-Host -noNewLine "odd value in a5 is "; findOddCount($a5)
Write-Host -noNewLine "odd value in a6 is "; findOddCount($a6)

=cut


my @a1 = (1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 7, 7);
my @a2 = (10, 10, 7, 7, 6, 6, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 7, 7, 10, 10);
my @a3 = (6, 6, 10, 10, 7, 7, 6, 6, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 7, 7, 10, 10);
my @a4 = (10, 10, 7, 7, 2, 2, 3, 3, 4, 4, 5, 5, 7, 7, 7, 7, 10, 10, 6);
my @a5 = (6, 6);
my @a6 = (1);

my @arrays = (\@a1, \@a2, \@a3, \@a4, \@a5, \@a6);

# This function will accept a list of integers,
# and return a hashtable where the keys are numbers,
# and the values are how many times (odd-only!) those numbers occurred.
# Example:
# INPUT: (1,1,1,2,3,3,4,4)
# OUTPUT: {1: 3, 2: 1}
sub find_odd_count {
    my @arr = @_;

    # number: occurrences pairs
    my %numbers_occurrences;

    foreach my $number (@arr){
        print("oo a number: $number \n")
    }
}

foreach my $arr (@arrays) {

    print Dumper(@$arr);

    print(Dumper(find_odd_count(@$arr)))
}