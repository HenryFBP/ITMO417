#!/usr/bin/env bash

###
# A System Administrator would like to monitor the system’s memory usage and be informed
# through email when the memory reaches a certain level. Write a script to monitor memory usage
# and send an e-mail when free memory drops below 1000 MB.
#

function echo_free_mem_kb(){
    cat /proc/meminfo | grep MemFree | awk '{print $2}'
}

echo "By Henry Post, hpost@hawk.iit.edu.
ITMO 417 at IIT
"

# Interval to check in seconds.
CHECK_INTERVAL=1

# Interval to wait after sending email. 1200 seconds = 20 minutes.
AFTER_TRIP_SLEEP=1200

# Minimum memory in MB.
MINIMUM_MEMORY=1000

