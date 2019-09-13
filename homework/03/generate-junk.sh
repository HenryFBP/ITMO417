#!/usr/bin/env bash

function fill_file_with_random_data() {
    head -c 20M </dev/urandom > $1
}

mkdir -p junk
pushd junk

mkdir -p img
pushd img
fill_file_with_random_data cool_image.jpg
fill_file_with_random_data cat.gif
popd

mkdir -p data
pushd data
fill_file_with_random_data names.txt
fill_file_with_random_data hard_drive.img
popd


popd