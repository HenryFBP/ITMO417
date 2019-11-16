Henry Post, <hpost@hawk.iit.edu>

ITMO 417

## Homework 4

## Question 2

### The code

```bash
#!/bin/bash
# A simple script with a function...
tryMe()
{
    USER=$1
    PASSWORD=$2
    shift; shift;
    # Having shifted twice, the rest is now comments ...
    COMMENTS=$@
    echo "Adding user $USER ..."
    echo useradd -c "$COMMENTS" $USER
    echo passwd $USER $PASSWORD
    echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}
echo "Start of script..."
add_a_user bob letmein Bob Holness the presenter
add_a_user fred badpassword Fred Durst the singer
add_a_user bilko worsepassword Sgt. Bilko the role model
echo "End of script..."
```

### What does this code do?

This code defines a function called `tryMe` that takes a username as a 1st argument and a password as a 2nd argument.

All other arguments are "flattened" into a single string by using `shift` and `$@`.

We can pretend to call `tryMe` with the following arguments:

```bash
tryMe henry mycoolpass a b c d e f g
```

And we get these variables

```python
USER='henry';
PASSWORD='mycoolpass';
COMMENTS='a b c d e f g';
```

It looks like `tryMe` is a function that creates a new user on a Linux system and allows comments to be added to their profile.

There is one flaw with this code: The person who created the `tryMe` function forgot to rename it to `add_a_user`, which is called on 'bob', 'fred', and 'bilko' later on.

To fix this, they can rename the function `tryMe` to `add_a_user`, or vice-versa.
