#!/usr/bin/env bash

# Echo a newline-separated list of current IP addresses this computer holds on all interfaces.
function echo_ips {
    #       ifaces,    only lines with inet, remove 'netmask.*',   remove 'inet',    strip spaces.
    echo "$(ifconfig | egrep -i "(inet\ )" | sed "s/netmask.*//g"| sed "s/inet//g" | sed "s/ //g")"
}

# Get the operating system's release name.
function echo_os_release {
    #      Get os-release file, Only get field with "PRETTY_NAME" 2nd field, remove quotes.
    echo "$(cat /etc/os-release | grep "PRETTY_NAME" | awk -F= '$1=="PRETTY_NAME" {print $2; }' | tr -d "\"" )"
}
# Get the user's name.
echo "First name:"
read first_name

echo "Last name:"
read last_name

# Display their name using string interpolation.
echo "Welcome, ${first_name} ${last_name}!"

# Run a command inside quotes using backticks.
# whoami will print the user name associated with the current User ID.
echo "You are currently logged in as '`whoami`'".

# Get a list of this computer's registered IP addresses, and print them.
echo "Here are your current IP addresses:"
echo $(echo_ips)

echo "OS Release:"
echo $(echo_os_release)