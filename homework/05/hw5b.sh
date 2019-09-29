#!/usr/bin/env bash

echo "By Henry Post, hpost@hawk.iit.edu.
ITMO 417 at IIT
"

# Prints a newline.
function newline() {
    echo ''
}

if ! hash egrep 2>/dev/null; then
    echo "Install 'egrep'!";
    exit 1
fi

FILENAME=sedDatafile.txt
OUT_DIR="out/"
if [[ -d ${OUT_DIR} ]]; then
    rm -r ${OUT_DIR}
fi
mkdir -p ${OUT_DIR}

echo "See the following folder for files modified by sed:"
realpath ${OUT_DIR}

# 1. Insert above the first line the title PERSONNEL FILE
sed "1s/^/PERSONNEL FILE\n/" ${FILENAME} > ${OUT_DIR}/1.txt

# 2. Remove the salaries ending in 500
sed "/500/d" ${FILENAME} > ${OUT_DIR}/2.txt

# 3. Print the contents of the file with the last name and first names reversed
sed -E "s/^([a-zA-Z]+) ([a-zA-Z]+):(.*)$/\2 \1:\3/"  ${FILENAME} > ${OUT_DIR}/3.txt

# 4. Append at the end of the file THE END
sed -e "\$aTHE END" ${FILENAME} > ${OUT_DIR}/4.txt

echo "# 1. Insert above the first line the title PERSONNEL FILE"
echo "Orig":
head -1 ${FILENAME}
newline

echo "Modified":
head -1 ${OUT_DIR}/1.txt
newline

echo "# 2. Remove the salaries ending in 500"
echo "Orig":
tail -10 ${FILENAME} | egrep --color '500|'
newline

echo "Modified":
tail -10 ${OUT_DIR}/2.txt
newline

echo "# 3. Print the contents of the file with the last name and first names reversed"
echo "Orig":
head -5 ${FILENAME}
newline

echo "Modified":
head -5 ${OUT_DIR}/3.txt
newline

echo "# 4. Append at the end of the file THE END"
echo "Orig":
tail -1 ${FILENAME}
newline

echo "Modified":
tail -1 ${OUT_DIR}/4.txt
newline