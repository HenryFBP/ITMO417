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

# Prints a newline.
function newline(){
echo ''
}

# Echoes a list of users that are currently logged in.
function echo_logged_in_users(){
    who
}

# Echoes a list of cpu-hungry processes.
function echo_cpu_hungry_processes(){
    top -b -n 1 -o %CPU | head -15
}

# Echoes a list of memory-hungry processes.
function echo_memory_hungry_processes(){
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

# Asks the user for a folder and shows them all of the files in that directory.
function find_files_by_extension() {

    echo "Enter path:"
    local files_dir
    read files_dir

    local abs_files_dir=`realpath $files_dir`

    # Make sure the directory exists.
    if [[ ! -d $abs_files_dir ]]; then
        echo "$abs_files_dir is not a directory that exists."
        exit 1
    fi

    echo "Using '${abs_files_dir}'."
    echo "Enter file extension (without '.'):"
    local file_ext
    read file_ext

    echo "Files ending in '$file_ext' in '$abs_files_dir':"

    # Show the files, or show an error message.
    ls -lash $abs_files_dir/*.$file_ext 2>/dev/null ||
        echo "No files ending in '$file_ext' exist in '$abs_files_dir'."

}

# Init user input to nonzero value for loop to work
INPUT="not zero :)"

echo_options

while [[ $INPUT != 0 ]]; do

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

        case $INPUT in

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