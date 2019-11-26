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

        $input = Read-Host "Enter a choice from 0 to $maxlen."

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


}


$options = @()

Run-Menu -Title "potato"