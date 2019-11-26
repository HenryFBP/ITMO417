# Start recording to file
Start-Transcript -path "$PSScriptRoot/question-2.out.txt"

Write-Host "Henry Post, hpost@hawk.iit.edu, ITMO 417 at IIT."

# Write a script that calculates the average performance score
# and prints out the members of the groups meeting the
# following criteria (each criterion should produce one group,
# rather than identifying a group that meets all four criteria):
#
# a. Native language is English
# b. Age is greater than 20
# c. Age is greater than 20 and native language is English
# d. Performance score is greater than 70

$firstnames = @("Sarah", "Jareth", "Ludo", "Hoggle");
$lastnames = @("Williams", "King", "Beast", "Dwarf");
$ages = @(15, 39, 33, 43);
$nativelanguages = @("English", "English", "Romanian", "English");
$performancescores = @(85, 99, 35, 75);

$avgperformancescore = 0
$performancescores.ForEach{ $avgperformancescore += $_ }

function Get-Full-Name
{
    param([int]$Index)
    return $firstnames[$Index] + " " + $lastnames[$Index]
}

# a. Native language is English
Write-Host
Write-Host "People whose native langauge is english:"
for ($i = 0; $i -lt $nativelanguages.Count; $i++) {
    if ($nativelanguages[$i] -eq "English")
    {
        Write-Host (Get-Full-Name $i)
    }
}

# b. Age is greater than 20
Write-Host
Write-Host "People whose age is greater than 20:"
for ($i = 0; $i -lt $ages.Count; $i++) {
    if ($ages[$i] -gt 20)
    {
        Write-Host (Get-Full-Name $i)
    }
}

# c. Age is greater than 20 and native language is English
Write-Host
Write-Host "People whose age is greater than 20 and whose native language is English:"
for ($i = 0; $i -lt $ages.Count; $i++) {
    if (($ages[$i] -gt 20) -And ($nativelanguages[$i] -eq "English"))
    {
        Write-Host (Get-Full-Name $i)
    }
}

# d. Performance score is greater than 70
Write-Host
Write-Host "People whose performance score is greater than 70:"
for ($i = 0; $i -lt $ages.Count; $i++) {
    if ($performancescores[$i] -gt 70)
    {
        Write-Host (Get-Full-Name $i)
    }
}

Stop-Transcript