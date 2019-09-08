#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#


MORNING_FLOOR=$((-1))        # 1AM is the start of 'morning'.
MORNING_CEIL=$((12 + 0))    # Noon is the end of 'morning'.
AFTERNOON_FLOOR=$((12 + 0)) # Noon is the start of 'afternoon'.
AFTERNOON_CEIL=$((12 + 5))  # 5PM is the end of 'afternoon'.
EVENING_FLOOR=$((12 + 5))   # 5PM is start of 'evening'.
EVENING_CEIL=$((12 + 12))   # 12PM is the end of 'evening'.

# Hour portion of the current time.
hour=$(date '+%R' | cut -d ':' -f1)

hour=0

# If the current hour is between the floor and ceiling of the morning, then...
if [[ $hour -gt $MORNING_FLOOR && $hour -le $MORNING_CEIL ]]; then
  echo "Hour ($hour) is between $MORNING_FLOOR and $MORNING_CEIL."
  echo "Good morning!"
elif [[ $hour -gt AFTERNOON_FLOOR && $hour -le $AFTERNOON_CEIL ]]; then
  echo "Hour ($hour) is between $AFTERNOON_FLOOR and $AFTERNOON_CEIL."
  echo "Good afternoon!"
elif [[ $hour -gt $EVENING_FLOOR && $hour -le $EVENING_CEIL ]]; then
  echo "Hour ($hour) is between $EVENING_FLOOR and $EVENING_CEIL."
  echo "Good evening!"
else
  echo "Time is not within any bounds!"
fi
