#!/usr/bin/env bash

#Question 1 (PowerShell Scripting)
#
#Given a PowerShell program shown below, finish the program by completing the function named findOddCount().
#The function finds a value in the given list that occurs an odd number of times.
#
#$a1 = (1,1,2,2,3,3,4,4,5,5,6,7,7,7,7)
#$a2 = (10,10,7,7,6,6, 2,2,3,3,4,4,5,5,6,7,7,7,7,10,10)
#$a3 = (6,6,10,10,7,7,6,6, 2,2,3,3,4,4,5,5,6,7,7,7,7,10,10)
#$a4 = (10,10,7,7, 2,2,3,3,4,4,5,5,7,7,7,7,10,10,6)
#$a5 = (6,6)
#$a6 = (1)
#
#Write-Host -noNewLine "odd value in a1 is "; findOddCount($a1)
#Write-Host -noNewLine "odd value in a2 is "; findOddCount($a2)
#Write-Host -noNewLine "odd value in a3 is "; findOddCount($a3)
#Write-Host -noNewLine "odd value in a4 is "; findOddCount($a4)
#Write-Host -noNewLine "odd value in a5 is "; findOddCount($a5)
#Write-Host -noNewLine "odd value in a6 is "; findOddCount($a6)

a1=(1 1 2 2 3 3 4 4 5 5 6 7 7 7 7);
a2=(10 10 7 7 6 6 2 2 3 3 4 4 5 5 6 7 7 7 7 10 10);
a3=(6 6 10 10 7 7 6 6 2 2 3 3 4 4 5 5 6 7 7 7 7 10 10);
a4=(10 10 7 7 2 2 3 3 4 4 5 5 7 7 7 7 10 10 6);
a5=(6 6);
a6=(1);

function echo_odd_count() {
#    echo "$@"
#    echo "test"

    declare -A "numbers_occurrences"

    # count up how many times each number occurs and store it in $numbers_occurrences
    for number in "$@" ; do
#        echo ${number}

        # if we've seen this number before,
        if test "${numbers_occurrences[$number]+isset}"; then
            # add 1
            numbers_occurrences[$number]=$((${numbers_occurrences[$number]} + 1))
        else # We haven't seen it before, except now, which is once.
            numbers_occurrences[$number]=1
        fi
    done

    # Find all the odd number occurrences
    declare -A odd_numbers_occurrences;

    for number in "${!numbers_occurrences[@]}"; do
        if ((${numbers_occurrences[$number]} % 2)); then # if number occurrences are odd,
            odd_numbers_occurrences[$number]=${numbers_occurrences[$number]}
        fi
    done

    echo "For the array of '$@':"
    for number in "${!odd_numbers_occurrences[@]}"; do
        occurrences=${odd_numbers_occurrences[$number]}

        echo "$number occurs $occurrences times."
    done



}

echo_odd_count "${a1[@]}"
echo_odd_count "${a2[@]}"
echo_odd_count "${a3[@]}"
echo_odd_count "${a4[@]}"
echo_odd_count "${a5[@]}"
echo_odd_count "${a6[@]}"