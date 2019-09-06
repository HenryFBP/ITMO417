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

function ping_host() {

  echo "Enter a host to ping:"

  echo_prompt
  read host

  ping -c 4 "${host}"

  if ! [ $? -eq 0 ]; then
    echo "Failed to ping '${host}'!"
  fi

}

function echo_prompt() {
  printf " > "
}

function echo_options() {
  # Print digit: option pairs
  for index in "${!Options[@]}"; do
    echo "$index: ${Options[$index]}"
  done

  echo "Select an option (1-$(($OptionsLen - 1))) or 0 to exit. Anything else (i.e. 'h') for help."

}

INPUT="not zero :)"

echo_options

while [[ $INPUT != 0 ]]; do

  echo_prompt

  read INPUT

  if ((INPUT > (OptionsLen - 1))); then
    echo "That number is too high!".
    echo_options
  elif ! [[ "$INPUT" =~ ^[0-9]+$ ]]; then
    echo "Input a number."
    echo_options
  else
    echo "Executing '${Options[$INPUT]}'..."

    case $INPUT in

    0)
      echo "Bye! :)"
      ;;

    1)
      ping_host
      ;;

    2)
      true
      ;;

    esac

    #TODO actually do stuff
  fi

done
