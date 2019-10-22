# ITMO 417 awk homework

Henry Post, hpost@hawk.iit.edu

## Question 1

a)
```bash
awk '$0 !~ /^$/' file
```

b)  

```bash
awk '$2 ~ /^[JT]/ {print $3}' file
```

c)  

```bash
awk '$2 !~ /[Mm]isc/ {print $3 + $4}' file
```

d)  

```bash
awk '$2 ~ /John|Fred/ {print $0}' file
```

e)  

```bash
awk 'END{print NR}' file
```

f)  

```bash
awk '{ print $NF }' file
```

g)  

```bash
awk 'NF > 4' file
```

h)  

```bash
awk '{print $2, $1}' file
```

i)  

```bash
awk -F: '$1 ~ /^....$/ {print $3, $1}' file
```

j) See `awk-q1j` and the associated PDF file.

k) See `awk-q1k` and the associated PDF file.
