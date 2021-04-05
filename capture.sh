#!/bin/sh

SCREENCAPTURE_CMD='unknown'

#Parse the command line arguments
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi
  shift
done

if test "$(uname)" = 'Linux'; then
  SCREENCAPTURE_CMD='import -window root'
elif test "$(uname)" = 'Darwin'; then
  SCREENCAPTURE_CMD='screencapture -t jpg -x'
else
  echo "This script doesn't support your OS type"
  exit 1
fi

PERIODI=4 #default to 4 seconds between captures. Can be changed with --period command line option
if [ ! -z "${period}" ]
    then
      PERIODI="$period"
fi

if [ ! -z "${app}" ] && test "$(uname)" != 'Darwin'
    then
      echo 'The --app option is currently only available on macOS.'
      exit 0
fi

# screen captures
while [ 1 ]; do
  APPINFOCUS=`osascript -e 'tell application "System Events"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'`
  if [ "${APPINFOCUS}" == "${app}" ] || [ -z "${app}" ] #if --app command line option is provided, only capture when the specified app is in focus
    then
      $SCREENCAPTURE_CMD ./images/`date +%s`.jpg
      echo "captured `date +%s`"
  fi
  sleep $PERIODI
done
