#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#

ONE_GIGABYTE_IN_KB=1048576

TEMP_DIR="/tmp/ITMO417/hw2/"  # Place to store files temporarily for this shell script.
TEMP_DIR_ZIP="$TEMP_DIR/zip/" # Place to store zipped folders.
TEMP_DIR_ZIP_FILE="${TEMP_DIR_ZIP}/archive.tar.gz"

function clean_temp_dir() {

  # Remove if exists,
  if [ -d ${TEMP_DIR} ]; then
    rm -r ${TEMP_DIR}
  fi

  # Make directories.
  mkdir -p ${TEMP_DIR}
  mkdir -p ${TEMP_DIR_ZIP}
}

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

# Given a directory, echo its size in kilobytes.
function echo_dir_size_in_kb() {
  du -s "$1" 2>/dev/null | awk '{print $1}'
}

# Convert KB to MB.
function echo_kb_to_mb() {
  echo $(($1 / 1000))
}

function send_file_by_email() {
  echo "Enter the name of a file to send by email:"

  echo_prompt
  read filename

  # Get absolute path.
  filename=$(realpath "${filename}")

  if ! [ -f "$filename" ]; then
    echo "File '$filename' does not exist or is a directory!"
    return
  fi

  echo "Enter email address:"

  echo_prompt
  read email

  echo "Not emailing file $filename to $email as professor told us not to email in class."

}

function send_dir_by_email() {
  echo "Enter the path of a directory to zip and email:"

  echo_prompt
  read directory

  # Make absolute so they're sure when we ask them questions later
  directory=$(realpath "${directory}")

  if ! [ -d "$directory" ]; then
    echo "Directory '${directory}' does not exist!"
    return
  fi

  dir_size_kb=$(echo_dir_size_in_kb "$directory")

  dir_size_gb=$((dir_size_kb / ONE_GIGABYTE_IN_KB))

  echo "Directory at '${directory}' is:"
  echo "${dir_size_kb}KB,"
  echo "$(echo_kb_to_mb ${dir_size_kb})MB,"
  echo "${dir_size_gb}GB."
  sleep 3

  if ((dir_size_gb > 1)); then

    echo "Are you sure you want to email this directory?"
    echo "It is ${dir_size_gb}GB large."

    read -p "Zip ${dir_size_gb}GB worth of data? [y,n] > " ynprompt

    echo ''

    case $ynprompt in

    y | Y)
      echo "Proceeding."
      ;;

    *)
      echo "Aborting."
      return
      ;;

    esac

  fi

  echo "Zipping '${directory}'..."
  tar -zcvf "${TEMP_DIR_ZIP_FILE}" "${directory}"
  echo "Done!"
  echo "Archive is at '${TEMP_DIR_ZIP_FILE}'."

  ls "${TEMP_DIR_ZIP_FILE}" -lash

  echo "Enter email address:"

  echo_prompt
  read email

  echo "Not emailing file ${directory} to ${email} as professor told us not to email in class."

}

function get_uname_from_uid() {

  echo "Enter a UID to view the username of:"

  echo_prompt
  read user_id

  result="$(getent passwd "${user_id}" | cut -d: -f1)"

  # If string is empty,
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

  if ! [[ "$INPUT" =~ ^[0-9]+$ ]]; then
    echo "Input a number."
    echo_options
  elif ((INPUT > (OptionsLen - 1))); then
    echo "That number is too high!".
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

    4)
      send_dir_by_email
      ;;

    5)
      send_file_by_email
      ;;

    esac

  fi

done

clean_temp_dir
