#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#

TEMP_DIR="/tmp/ITMO417/hw2/file_workdir/"

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

function get_uname_from_uid() {

  echo "Enter a UID to view the username of:"

  echo_prompt
  read user_id

  result="$(getent passwd "${user_id}" | cut -d: -f1)"

  if [ -z "$result" ]; then
    echo "No user with the ID '${user_id}' exists."
    return
  fi

  echo "The user ID '${user_id}' is associated with the username '${result}'."

}

function see_hops() {

  if hash traceroute 2>/dev/null; then
    true
  else
    echo "You do not have 'traceroute' installed. Please install it using 'apt' or 'dnf'."
    return
  fi

  echo "Enter a host to see the hops taken:"

  echo_prompt
  read host

  IFS= #This prevents newlines from being globbed
  raw_hops_output="$(traceroute "$host")"

  if ! [ $? -eq 0 ]; then
    echo "Could not query host '$host'."
    return
  fi

  echo $raw_hops_output

  number_hops="$(echo "${raw_hops_output}" | wc -l)"

  number_hops=$(($number_hops - 1))

  echo "It took ${number_hops} hops to get to ${host}."

}

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

  echo "Select an option (1-$(($OptionsLen - 1))) or 0 to exit. Anything else (i.e. 'h') to show this help again."

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
      see_hops
      ;;

    3)
      get_uname_from_uid
      ;;

    esac

    #TODO actually do stuff
  fi

done
