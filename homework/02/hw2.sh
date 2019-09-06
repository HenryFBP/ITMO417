#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#

# Associative array with commands
Options=(
  "Exit"
  "Ping a host"
  "See hops to a host"
  "Get a username from a UID"
  "Zip a directory and send it via email"
  "Send a file via email"
)

# Length of all commands they can enter
OptionsLen=${#Options[@]}

function echo_prompt() {
  printf " > "
}

function echo_options() {
  # Print digit: option pairs
  for index in "${!Options[@]}"; do
    echo "$index: ${Options[$index]}"
  done

  echo "Select an option (1-$(($OptionsLen - 1))) or 0 to exit."

}

INPUT="not zero :)"

while [[ $INPUT != 0 ]]; do

  echo_options

  echo_prompt

  read INPUT

done
