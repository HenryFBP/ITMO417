function Run-Menu
{
    param (
        [string]$Title = 'My Menu',
        [string[]]$options = @('Item 1', 'Item Two'),
        [Object[]]$callbacks = @({ Write-Host "You chose item one." }, { Write-Host "You chose item 2!" })
    )
    Clear-Host
    Write-Host "================ $Title ================"

    for ($i = 0; $i -lt $options.Count; $i++) {
        Write-Host "$i)" $options[$i]
        & $callbacks[$i] # This executes the lambda fn
    }

    Write-Host "Q: Press 'Q' to quit."
}


$options = @()

Run-Menu -Title "potato"