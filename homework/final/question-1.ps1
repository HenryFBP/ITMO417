Start-Transcript -path "$PSScriptRoot/question-1.out.txt"

Write-Host "Henry Post, hpost@hawk.iit.edu, ITMO 417 at IIT."

<#
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
#>

$a1 = (1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 7, 7)
$a2 = (10, 10, 7, 7, 6, 6, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 7, 7, 10, 10)
$a3 = (6, 6, 10, 10, 7, 7, 6, 6, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 7, 7, 10, 10)
$a4 = (10, 10, 7, 7, 2, 2, 3, 3, 4, 4, 5, 5, 7, 7, 7, 7, 10, 10, 6)
$a5 = (6, 6)
$a6 = (1)

$all_arrays = @($a1, $a2, $a3, $a4, $a5, $a6)

function Find-Odd-Count
{
    param (
        [int[]]$numbers = (1, 2, 3, 3, 3)
    )

    # number: occurrences pairs
    $numbers_occurrences = @{ }

    # count up how many times each number occurs and store it in $numbers_occurrences
    for ($i = 0; $i -lt $numbers.Count; $i++) {

        $aNumber = $numbers[$i]

        # if we've seen this number before,
        if ( $numbers_occurrences.ContainsKey($aNumber))
        {
            # add 1
            $numbers_occurrences[$aNumber] = $numbers_occurrences[$aNumber] + 1
        }
        else # We haven't seen it before, except now, which is once.
        {
            $numbers_occurrences[$aNumber] = 1
        }
    }

    # Find all the odd number occurrences
    $odd_numbers_occurrences = @{ }

    foreach ($number in $numbers_occurrences.Keys)
    {
        $timesOccurs = $numbers_occurrences[$number]

        if ($timesOccurs % 2 -ne 0) # if number occurrences are not odd,
        {
            $odd_numbers_occurrences[$number] = $timesOccurs
        }
    }

    return $odd_numbers_occurrences

}


foreach ($arr in $all_arrays)
{
    Write-Host
    Write-Host "Input array: $arr"

    $odd_numbers_occurrences = Find-Odd-Count($arr)

    foreach ($number in $odd_numbers_occurrences.Keys)
    {
        $times = $odd_numbers_occurrences[$number]

        Write-Host "$number occurs $times times."
    }


}
