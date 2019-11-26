# Start recording to file
Start-Transcript -path "./question-1.out.txt"

Write-Host "Henry Post, hpost@hawk.iit.edu, ITMO 417 at IIT."

function Run-Menu
{
    param (
        [string]$Title = 'My Menu',
        [string[]]$options = @('Item 1', 'Item Two'),
        [Object[]]$callbacks = @({ Write-Host "You chose item one." }, { Write-Host "You chose item 2!" })
    )

    $input = ""
    $maxlen = $options.Count

    while (!($input -eq 'Q'))
    {
        Write-Host "================ $Title ================"

        for ($i = 0; $i -lt $options.Count; $i++) {
            Write-Host "$i)" $options[$i]
        }

        Write-Host "Press 'Q' to quit."

        $input = Read-Host -Prompt "Enter a choice from 0 to $maxlen."

        try
        {
            $input = [int]$input
            if ($input -lt 0)
            {
                Write-Host "Cannot choose <0!"
            }
            elseif ($input -gt $maxlen)
            {
                Write-Host "Cannot choose >$maxlen!"
            }
            else
            {
                Write-Host "You chose $input!"
                & $callbacks[$input] # This executes the lambda fn
            }

        }
        catch
        {
            Write-Host "Choice must be an integer."
        }
    }

    Write-Host "Goodbye!"
}


Run-Menu `
    -Title "Question 1, hpost@hawk.iit.edu, ITMO417"`
    -options @( "Display hostname", `
                'Display IP address',`
                'Display all logged on users',`
                "Display disk info",`
                "Display date info",`
                "Display all Get-* commands",`
                'Exit program')`
    -callbacks @(   { Write-Host "Your hostname is '$env:computername'."},`
                    { Get-NetIPAddress },`
                    { query user /server:$SERVER },`
                    { Get-WmiObject -class win32_logicaldisk },`
                    { Get-Date },`
                    { Get-Command -Verb "Get" },`
                    { Write-Host "Bye!"; Stop-Transcript; Exit 0; })`

Stop-Transcript