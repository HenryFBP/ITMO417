function Show-Menu
{
    param (
        [string]$Title = 'My Menu',
        [string[]]$options = @('Item 1', 'Item Two')
    )
    Clear-Host
    Write-Host "================ $Title ================"

    for ($i = 0; $i -lt $options.Count; $i++) {
        Write-Host "$i)" $options[$i]
    }

    Write-Host "Q: Press 'Q' to quit."
}

Show-Menu -Title "potato" -options "asdf","asdFASDFAFD"