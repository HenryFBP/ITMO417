# ITMO 417 awk homework

Henry Post, hpost@hawk.iit.edu

## Question 1

a)

```bash
awk '$0 !~ /^$/' file
```

Print all lines (`$0`) NOT matching an empty line (`/^$/`).

b)  

```bash
awk '$2 ~ /^[JT]/ {print $3}' file
```

If the second field starts with `J` or `T`, print the third field.

c)  

```bash
awk '$2 !~ /[Mm]isc/ {print $3 + $4}' file
```

If the second field contains `Misc` or `misc`, print the numerical sum of the third field and fourth field.

d)  

```bash
awk '$2 ~ /John|Fred/ {print $0}' file
```

If the second field contains `John` or `Fred`, print the whole line.

e)  

```bash
awk 'END{print NR}' file
```

At the end of the file, print the 'number of records' (line count).

f)  

```bash
awk '{ print $NF }' file
```

Print the last field (space-separated) in each line.

g)  

```bash
awk 'NF > 4' file
```

Print all lines with more than four fields.

h)  

```bash
awk '{print $2, $1}' file
```

Print the _second then first_ field in each line.

i)  

aaaa:aaaa:aaaa:aaaa:

```bash
awk -F: '$1 ~ /^....$/ {print $3, $1}' file
```

Use COLON `:` as a delimiter, not SPACE ` `.

For each line with exactly four characters in its first field, print the first and third field.

EXAMPLE FILE:
```text
aaaa:b:c
```

In this case, `aaaa c` will be printed.

j) See `awk-q1j` and the associated PDF file.

k) See `awk-q1k` and the associated PDF file.
