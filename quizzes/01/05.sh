#!/usr/bin/env bash

###
# Write a simple shell script that asks a user to enter a Linux login id and the script will extract a line from /etc/passwd file that contains the id name entered.
# Assume the login id entered is a valid login id.
#

printf "Enter a login ID to get information about from /etc/passwd:
 > "

read LOGINID

echo $(cat /etc/passwd | grep $LOGINID)