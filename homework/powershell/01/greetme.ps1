# Using Windows PowerShell, rewrite your Linux Shell script called greetme that will:
#   a. Ask the user to enter full name
#   b. Display a greeting message, “Hello <user full name>. How are you? Welcome to
#   Windows PowerShell Scripting”.
#   c. Print the system date and the time
#   d. Print the system disks information
#   e. Print the name of your Windows machine
#   f. Print the name and release of this operating system
#   g. Display all processes currently running on the operating system
#   h. Display the Windows IP address
#   i. Tell the user “Good bye <user full name>. See you next time!”

# Start recording to file
Start-Transcript -path "greetme.out.txt"

Write-Host "Henry Post, hpost@hawk.iit.edu, ITMO 417 at IIT."

# Get name
$input = Read-Host -Prompt "Enter your name"

Write-Host "Hello $input. How are you? Welcome to Windows PowerShell Scripting."

# Current date
Get-Date

# Disk info
Get-WmiObject -class win32_logicaldisk

# Hostname
Write-Host "Your hostname is '$env:computername'."

# OS release
Write-Host "OS release info:"
[environment]::OSVersion.Version

# Process list
Get-Process

# Windows IP addresses
Get-NetIPAddress

Write-Host "Good bye $input. See you next time!"

Stop-Transcript