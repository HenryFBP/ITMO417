#!/usr/bin/env bash

./hw5a.sh  | aha > /tmp/x.html
wkhtmltopdf /tmp/x.html hw5a.pdf

./hw5b.sh  | aha > /tmp/x.html
wkhtmltopdf /tmp/x.html hw5b.pdf