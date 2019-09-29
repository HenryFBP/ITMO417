#!/usr/bin/env bash

echo "By Henry Post, hpost@hawk.iit.edu."

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
grep -P "([aeiouAEIOU]).\1" "$FILENAME"
newline

echo "HW5A 5: Lines not beginning with 'S'"
grep -P "^[^S]" "$FILENAME"
newline

echo "HW5A 6: Lines with 'CA', case-insensitive."
grep -P "[cC][aA]" "$FILENAME"
newline

echo "HW5A 7: Lines with an email address, plus line numbers."
grep -n -P "@" "$FILENAME"
newline

echo "HW5A 8: All lines without the sequence 'Sep.'."
grep -v -P "Sep\." "$FILENAME"
newline

echo "HW5A 8: All lines with the word 'de' as a whole word."
grep -P " de " "$FILENAME"
newline
