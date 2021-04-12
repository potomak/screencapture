#!/bin/sh

SCREENCAPTURE_CMD='unknown'

# Parse the command line arguments
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

PERIOD=4 # Default to 4 seconds between captures. Can be changed with --period command line option
if [ ! -z "${period}" ]; then
  if ! [ "$period" -eq "$period" ] 2>/dev/null || [ "$period" -eq "0" ]; then # Evaluate whether $period is a number and whether it is > 0
    echo "The --period option specifies the time in seconds between captures and should be integer greater than 0. No non-zero integer was provided." >&2; exit 1
  fi
  PERIOD="$period"
fi

if [ ! -z "${app}" ]; then
  if test "$(uname)" != 'Darwin'; then # Check if the system is macOS, as the --app option is only available for macOS
    echo 'The --app option is currently only available on macOS.'
    exit 1
  fi
  if ! open -Ra "$app"; then # Check whether the specified app is installed
    echo "It seems like '$app' is not installed on your system."
    exit 1
  fi
fi

# Screen captures
while [ 1 ]; do
  if [ ! -z "${app}" ]; then
    APPINFOCUS=`osascript -e 'tell application "System Events"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'`
  fi
  if [ "${APPINFOCUS}" == "${app}" ] || [ -z "${app}" ]; then # If --app command line option is provided, only capture when the specified app is in focus
    $SCREENCAPTURE_CMD ./images/`date +%s`.jpg
    echo "captured `date +%s`"
  fi
  sleep $PERIOD
done
