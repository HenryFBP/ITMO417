# ITMO 417 awk homework

Henry Post, <hpost@hawk.iit.edu>

## Question 1

a) ```awk '$0 !~ /^$/' file```
b) awk '$2 ~ /^[JT]/ {print $3}' file
c) awk '$2 !~ /[Mm]isc/ {print $3 + $4}' file
d) awk '$2 ~ /John|Fred/ {print $0}' file
e) awk 'END{print NR}' file
f) awk '{ print $NF }' file
g) awk 'NF > 4' file
h) awk '{print $2, $1}' file
i) awk -F: '$1 ~ /^....$/ {print $3, $1}' file
j) The command ps -ef displays all Linux processes.
Use awk and other Linux utilities to display all PIDs on screen without the header label
"PID".
k) Using awk, write a command to display fields 1 and 5 from file /etc/passwd.
