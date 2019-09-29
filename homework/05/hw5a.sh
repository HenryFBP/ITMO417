#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#

# Prints a newline.
function newline() {
    echo ''
}

FILENAME=grepDatafile.txt

echo "HW5A 1: Phone numbers with extensions"
grep -P '\d{3}-\d{3}-\d{4} [xX]\d{4}' "$FILENAME"
newline

echo "HW5A 2: 3 digits followed by a blank"
grep -P "\d{3} " "$FILENAME"
newline

echo "HW5A 3: Lines with a date"
grep -P "[a-zA-Z]{3}\. \d{1,2}, \d{4}" "$FILENAME"
newline

echo "HW5A 4: Vowels followed by a character with capturing groups"
grep -P "potato :)" "$FILENAME"