#!/usr/bin/env bash

###
# Henry Post, hpost@hawk.iit.edu
#

# Prints a newline.
function newline() {
    echo ''
}

FILENAME=sedDatafile.txt
OUT_DIR="out/"
mkdir -p $OUT_DIR

echo "See the following folder for files modified by sed:"
echo `realpath $OUT_DIR`

# 1. Insert above the first line the title PERSONNEL FILE
sed "1s/^/PERSONNEL FILE\n/" ${FILENAME} > ${OUT_DIR}/1.txt

# 2. Remove the salaries ending in 500
sed "/500/d" ${FILENAME} > ${OUT_DIR}/2.txt

# 3. Print the contents of the file with the last name and first names reversed
sed "/500/d" ${FILENAME} > ${OUT_DIR}/2.txt

# 4. Append at the end of the file THE END

