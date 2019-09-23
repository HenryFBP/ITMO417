#!/usr/bin/env bash

function fill_file_with_random_data() {
    head -c 20M </dev/urandom > $1
}

rm -r junk

mkdir -p junk
pushd junk

mkdir -p img
pushd img
fill_file_with_random_data cool_image.jpg
fill_file_with_random_data cool_image2.jpg
fill_file_with_random_data cool_image3.jpg
fill_file_with_random_data cat.gif
popd

mkdir -p data
pushd data
fill_file_with_random_data names.txt
fill_file_with_random_data hard_drive.img
fill_file_with_random_data core
fill_file_with_random_data mycode1.o
fill_file_with_random_data mycode3.o
fill_file_with_random_data mycode2.o
popd

tree .

popd