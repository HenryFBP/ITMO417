#!/usr/bin/env bash

mkdir -p junk
pushd junk

mkdir -p img
pushd img
touch cool_image.jpg
touch cat.gif
popd

mkdir -p data
pushd data
touch names.txt
touch hard_drive.img
popd


popd