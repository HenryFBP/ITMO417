#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#


better_name="oh wow im a name"


echo $better_name

# Echoes the usage of the program.
function usage() {
  echo "Usage: $0 [-r]"
  echo "    -r    Repeat?"
}

#
if [[ $# == 1 ]]; then
  echo 'oh wow 1 arg thx >:^('
else
  usage
  exit 1
fi