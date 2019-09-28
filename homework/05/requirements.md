# HW5

## HW5A - grep 

This following assignment uses a file called grepDatafile.txt. Please see the attached file. 

Once you have the file, write a series of grep statements that do the following: 

1. Print all lines that contain a phone number with an extension (the letter x or X followed by four digits).

2. Print all lines that begin with three digits followed by a blank. Your answer must use the \{ and \} repetition specifier.

3. Print all lines that contain a date. Hint: this is a very simple pattern. It does not have to work for any year before 2000.

4. Print all lines containing a vowel (a, e, i, o, or u) followed by a single character followed by the same vowel again. Thus, it will find “eve” or “adam” but not “vera”. Hint: \( and \)

5. Print all lines that do not begin with a capital S.

6. Print all lines that contain CA in either uppercase or lowercase.

7. Print all lines that contain an email address (they have an @ in them), preceded by the line number.

8. Print all lines that do not contain the word Sep. (including the period).

9. Print all lines that contain the word de as a whole word.

Your patterns should work in any generic file of this sort. They should not be dependent upon the data in this particular file; if I add more lines of the same form to the file, your patterns should still work. 


## HW5B - sed

This following assignment uses a file called sedDatafile.txt. Please see the attached file. 
Using the datebook file mentioned above, do the following tasks;

Write a sed script that will

1. Insert above the first line the title PERSONNEL FILE 

2. Remove the salaries ending in 500 

3. Print the contents of the file with the last name and first names reversed 

4. Append at the end of the file THE END  

Due on 10/1/19 @11:59pm