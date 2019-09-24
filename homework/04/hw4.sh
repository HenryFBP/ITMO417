#!/usr/bin/env bash

###
#
# Henry Post, hpost@hawk.iit.edu

# Extensions of files deemed to be useless.
JunkFileExtensions=(
"mp3"
"jpg"
"gif"
"o"
)

# Names of files deemed to be useless.
JunkFileNames=(
"core"
)

ONE_GIGABYTE_IN_KB=1048576

# Given a directory, echo its size in kilobytes.
function echo_dir_size_in_kb() {
  du -s "$1" 2>/dev/null | awk '{print $1}'
}

# Convert KB to MB.
function echo_kb_to_mb() {
  echo $(($1 / 1000))
}

function echo_date_nospace() {
  DATE="$(date +%m-%d-%y-%l:%M%p-%s)"
  echo "${DATE// /}"
}

# Echo the UUID and date.
function echo_uuid_and_date() {
  echo "$(echo_date_nospace)-$(uuidgen)"
}

# Given a name, echo a probably-unique version of it.
function echo_unique_name() {
  echo "$1-$(echo_uuid_and_date)"
}

function zip_home_directory() {

  # ~ expands to home dir
  directory=$(realpath ~) # Change the directory to "junk" to test stuff.

  # Sanity check -- does it exist?
  if ! [[ -d "$directory" ]]; then
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

    echo "Are you sure you want to zip your home directory?"
    echo "It is ${dir_size_gb}GB large."

    read -p "Zip ${dir_size_gb}GB worth of data? [y,n] > " ynprompt

    echo ''

    case ${ynprompt} in

    y | Y)
      echo "Proceeding."
      ;;

    *)
      echo "Aborting."
      return
      ;;

    esac

  fi

  ZIP_LOCATION="/tmp/$(echo_uuid_and_date).tar.gz"

  echo "Zipping '${directory}'..."
  tar -zcvf "$ZIP_LOCATION" ${directory}
  echo "Done!"
  echo "Archive is at '${ZIP_LOCATION}'."

  ls "${ZIP_LOCATION}" -lash

}

function echo_prompt() {
    printf " > "
}

function new_777_folder_with_stickybit() {

    echo "Enter a folder to create with permissions=777 and the stickybit set:"
    echo_prompt

    # Read their folder path
    local FOLDER_PATH
    read FOLDER_PATH

    # Get the absolute path.
    local ABS_FOLDER_PATH=`realpath ${FOLDER_PATH}`

    # Make it and set bits.
    mkdir -p ${ABS_FOLDER_PATH}
    chmod 777 ${ABS_FOLDER_PATH}
    chmod +t ${ABS_FOLDER_PATH}

    # Show it to the user.
    ls -lashd ${ABS_FOLDER_PATH}

}

# Remove all 'junk' files in a directory.
function remove_junk_files() {

    echo "Files matching these patterns will be removed:"

    for filename in ${JunkFileNames[@]}; do
        echo "${filename}"
    done

    for fileext in ${JunkFileExtensions[@]}; do
        echo "*.${fileext}"
    done

    # XXX

    echo "Enter a directory to clear of junk files:"
    echo_prompt

    local JUNK_DIR
    read JUNK_DIR
    ABS_JUNK_DIR=`realpath ${JUNK_DIR}`

    # Make sure the dir exists
    if [[ ! -d ${ABS_JUNK_DIR} ]]; then
        echo "Directory $JUNK_DIR does not exist!"
        exit 1
    fi

    # Move to the directory full of junk files
    pushd ${ABS_JUNK_DIR} 1>/dev/null 2>&1

    # For all junk filenames,
    for filename in ${JunkFileNames[@]}; do

        # If the file exists,
        if ls "$filename" 1>/dev/null 2>&1; then
            # Verbosely remove it.
            rm -v "${filename}"
        fi
    done

    # For all junk filenames,
    for fileext in ${JunkFileExtensions[@]}; do

        # If the file extension glob pattern exists,
        if find *.${fileext} 1>/dev/null 2>&1; then

            # Go through each match and verbosely remove it.
            for junkfilepath in $(find *.${fileext}); do
                rm -v "$junkfilepath"
            done
        fi
    done

    # Restore dir.
    popd 1>/dev/null 2>&1

    echo "Done cleaning '$ABS_JUNK_DIR'!"

}

# Prints a newline.
function newline() {
    echo ''
}

# Echoes a list of users that are currently logged in.
function echo_logged_in_users() {
    who
}

# Echoes a list of cpu-hungry processes.
function echo_cpu_hungry_processes() {
    top -b -n 1 -o %CPU | head -15
}

# Echoes a list of memory-hungry processes.
function echo_memory_hungry_processes() {
    top -b -n 1 -o %MEM | head -15
}


# Associative array with commands
Options=(
"Exit"
"General server information (logged in users, load, disk space, RAM)"
"Find files with extension"
"Remove junk files in a dir (ending in [${JunkFileExtensions[*]}] or named exactly [${JunkFileNames[*]}])"
"Create a new directory with perms=777 and stickybit on"
"Run the homework 2 shell script"
"Compress all files in your home directory"
)

# Length of all commands they can enter
OptionsLen=${#Options[@]}

function echo_options() {
    # Print digit: option pairs
    for index in "${!Options[@]}"; do
        echo "$index: ${Options[$index]}"
    done

    echo "Select an option (1-$(($OptionsLen - 1))) or 0 to exit. Anything else (i.e. 'h') to show this help again."

}

# Asks the user for a folder and shows them all of the files in that directory.
function find_files_by_extension() {

    echo "Enter path:"
    local files_dir
    read files_dir

    local abs_files_dir=`realpath ${files_dir}`

    # Make sure the directory exists.
    if [[ ! -d ${abs_files_dir} ]]; then
        echo "$abs_files_dir is not a directory that exists."
        exit 1
    fi

    echo "Using '${abs_files_dir}'."
    echo "Enter file extension (without '.'):"
    local file_ext
    read file_ext

    echo "Files ending in '$file_ext' in '$abs_files_dir':"

    # Show the files, or show an error message.
    ls -lash ${abs_files_dir}/*.${file_ext} 2>/dev/null ||
        echo "No files ending in '$file_ext' exist in '$abs_files_dir'."

}

# Init user input to nonzero value for loop to work
INPUT="not zero :)"

echo_options

while [[ ${INPUT} != 0 ]]; do

    echo_prompt

    read INPUT

    # If it is not all digits,
    if ! [[ "$INPUT" =~ ^[0-9]$ ]]; then
        echo "Input a number."
        echo_options
    # If it is too high,
    elif ((INPUT > ( OptionsLen - 1 ))); then
        echo "That number is too high!".
        echo_options
    # It's a valid number within our bounds
    else
        echo "Executing '${Options[$INPUT]}'..."

        case ${INPUT} in

            0)
                echo "Bye! :)"
            ;;

            1)
                newline
                echo "Logged in users:"
                echo_logged_in_users

                newline
                echo "Processes using the CPU:"
                echo_cpu_hungry_processes

                newline
                echo "Processes using memory:"
                echo_memory_hungry_processes

                newline
                echo "Disk space information:"
                df -h

                newline
                echo "Block device information:"
                lsblk

                newline
                echo "System has been online for:"
                uptime
            ;;

            2)
                find_files_by_extension
            ;;

            3)
                remove_junk_files
            ;;

            4)
                new_777_folder_with_stickybit
            ;;

            5)
                # Try my git repo's HW2 or fallback to the bundled one.
                ./../02/hw2.sh 2>/dev/null || ./hw2.sh
                echo "Returned from homework 2 shell script. This is homework 4's shell script."
            ;;

            6)
                zip_home_directory
            ;;

        esac

    fi
done