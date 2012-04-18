#!/bin/sh

SCREENCAPTURE_CMD='unknown'

if test "$(uname)" = 'Linux'; then
  SCREENCAPTURE_CMD='import -window root'
elif test "$(uname)" = 'Darwin'; then
  SCREENCAPTURE_CMD='screencapture -t jpg -x'
else
  echo "This script doesn't support your OS type"
  exit 1
fi

# screen captures
while [ 1 ]; do
  $SCREENCAPTURE_CMD ./images/`date +%s`.jpg
  echo "captured `date +%s`"
  sleep 4
done
