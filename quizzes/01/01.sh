#!/usr/bin/env bash

###
# Write a simple script to print "Hello [user name] " on the screen.
#
# The user name (user full name) SHOULD NOT be hard-coded. Extract the name from file /etc/passwd
#

# Make sure they are root as we must read from /etc/passwd.
if [[ ! $(id -u) -eq 0 ]]
then
  echo "You must be root to run this!"
  exit 1
fi

# Get all IDs that match 1NNN, where N is a digit. Print the username field.
NAME=$(sudo cat /etc/passwd | grep -P "1\d{3}" | awk -F: '{ print $1 }')

echo "Hello, $NAME!"