#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#

# Prints a newline.
function newline() {
    echo ''
}

# The homework says to use datafile, but it should be datebook.
FILENAME=datebook.txt

echo "HW5A 1: Phone numbers"
grep -P '\d{3}-\d{3}-\d{4}' "$FILENAME"
newline

echo "HW5A 2: 3 digits followed by a blank"
grep -P ":\d\d\d\ " "$FILENAME"
newline

echo "HW5A 3: Lines with a date"
grep -P ":\d{1,2}/\d{1,2}/\d{1,2}" "$FILENAME"
newline

