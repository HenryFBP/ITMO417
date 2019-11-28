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

    # count up how many times each number occurs and store it in $numbers_occurrences
    foreach my $number (@arr) {
        # print("oo a number: $number \n");

        # if we've seen this number before,
        if (defined($numbers_occurrences{$number})) {
            # add 1
            $numbers_occurrences{$number} = $numbers_occurrences{$number} + 1;
        }
        else { # We haven't seen it before, except now, which is once.
            $numbers_occurrences{$number} = 1;
        }
    }

    # print("total time all numbers occur:\n");
    # print(Dumper(%numbers_occurrences));

    # Find all the odd number occurrences
    foreach my $number (keys %numbers_occurrences) {
        my $occurrences = $numbers_occurrences{$number};

        if (!($occurrences & 0x1)) {              # If it is even, i.e. its last bit is not set,
            delete($numbers_occurrences{$number}) # Delete it.
        }
    }

    # print("total time all numbers occur an odd amount of times:\n");
    # print(Dumper(%numbers_occurrences));

    return %numbers_occurrences;

}

foreach my $arr (@arrays) {

    # print(Dumper(@$arr));

    my %odd_numbers_occurrences = (find_odd_count(@$arr));

    print("For these numbers: ");

    foreach my $n (@$arr) {
        print("$n ");
    }
    print("\n");

    foreach my $number (keys %odd_numbers_occurrences) {
        my $occurrences = $odd_numbers_occurrences{$number};


        print("$number occurs $occurrences times.\n")
    }
}