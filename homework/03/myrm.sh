#!/usr/bin/env bash

WASTEBASKET_DIR=$HOME/WasteBasket/

if ! [ -d $WASTEBASKET_DIR ]; then
  mkdir -p $WASTEBASKET_DIR
fi

# Echo the UUID and date.
function echo_uuid_and_date() {
    echo "`date +%m-%d-%y-%l:%M%p-%s`-`uuidgen`"
}

# Given a name, echo a probably-unique version of it.
function echo_unique_name() {
    echo "$1-"`echo_uuid_and_date`
}
echo "Your deleted files will be stored in '$WASTEBASKET_DIR'."

echo_unique_name "potato"