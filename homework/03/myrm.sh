#!/usr/bin/env bash

WASTEBASKET_DIR=$HOME/WasteBasket/

if ! [ -d $WASTEBASKET_DIR ]; then
  mkdir -p $WASTEBASKET_DIR
fi

# Echo the UUID and date.
function echo_uuid_and_date() {
  echo "$(date +%m-%d-%y-%l:%M%p-%s)-$(uuidgen)"
}

# Given a name, echo a probably-unique version of it.
function echo_unique_name() {
  echo "$1-"$(echo_uuid_and_date)
}
echo "Your deleted files will be stored in '$WASTEBASKET_DIR'."

# Show usage.
function usage() {
  echo "Usage:"
  echo "$0 <FILE-TO-REMOVE>"
}

# Trim the slashes at the end of a string and echo it.
function echo_trim_slashes() {
  echo $1 | sed 's:/*$::'
}

# Less than one argument supplied.
if [[ $# < 1 ]]; then
  usage
  exit 1
fi

# Absolute path to file to be recycled.
absolute_garbage_path=$(readlink -f $1)
absolute_garbage_path=$(echo_trim_slashes $absolute_garbage_path)

if [[ ! -e $absolute_garbage_path ]]; then
  echo "File at ${absolute_garbage_path} does not exist!"
  exit 1
fi

# A unique name for the file or folder being recycled.
unique_name=$(echo_unique_name $(basename $1))
recycled_filepath="${WASTEBASKET_DIR}${unique_name}"

echo "About to perform the following move operation:"

echo "[  SRC  ] --> $absolute_garbage_path"
echo "[  DEST ] --> $recycled_filepath"
echo "[  SIZE ]  :  $(du -sh ${absolute_garbage_path} | cut -f1)"

read -p "Is this move operation okay? (y/n)
 > " INPUT

echo $INPUT

case $INPUT in

y | Y)
  echo "YES"
  ;;

n | N)
  echo "NOPE"
  ;;

*)
  echo "lol what"
  ;;
esac
