#!/usr/bin/env bash

###
# Write a simple menu system, with the menu options as follows(note: this menu does not have to respond to the user's input at this stage):
#
#
# 0. Exit
# 1. Output a text version
# 2. Output an HTML version
# 3. Print help
# 4. Provide a shell prompt
#
# Select an option [1-4] or 0 to exit:
#

# Associative array with commands
Options=(
    "Exit"
    "Output a text version"
    "Output an HTML version"
    "Print help"
    "Provide a shell prompt"
)

# Length of all commands they can enter
OptionsLen=${#Options[@]}

# Print digit: option pairs
for index in ${!Options[@]}; do
    echo "$index: ${Options[$index]}"
done

echo "Select an option (1-$(( $OptionsLen - 1))) or 0 to exit."

# Read input
printf " > "
read INPUT

# Handling input not required