#!/bin/sh

# screen captures
while [ 1 ]; do
  screencapture -t jpg -x ./images/`date +%s`.jpg
  echo "captured `date +%s`"
  sleep 4
done