# ITMO 417 Midterm

Henry Post, <hpost@hawk.iit.edu>

## Question 1

### Code

```bash
#!/bin/bash
ARGS=2
E_BADARGS=65
if [ $# -ne "$ARGS" ]
then
  echo "Usage: `basename $0` source destination"
  exit $E_BADARGS 
fi

source=$1
destination=$2

find "$source" -depth | cpio -admvp "$destination"
exit 0
```

### Explanation

This code accepts two arguments on the command line, "source" and "destination".

It will search for a file or file pattern matching "source", and copy it into "destination".

## Question 2

### Code

```bash
#!/bin/bash

BADDIR=65                       # No such directory.
projectdir=/home/bozo/projects  # Directory to clean up.

cleanup_pfiles ()
{
    if [ ! -d "$1" ]    # Test if target directory exists
    then
      echo "$1 is not a directory."
      return $BADDIR
    fi

    rm -f "$1"/*
    return 0    # Success
}

cleanup_pfiles $projectdir

exit 0
```

### Explanation

This code cleans up a directory, `/home/bozo/projects`. It deletes all files in that directory. That's it.

## Question 3-5

See attached code.