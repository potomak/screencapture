# Screen capture time-lapse

A simple script to make time-lapse videos of your work.

Using it is as simple as following those two steps.

## Step 1

Run `capture.sh` to start grabbing your screen:

    $ ./capture.sh

When you want to make a break just stop the process using `ctrl-c` and restart when you're done.

Default capture rate is one screenshot every 4 seconds.

## Step 2

Run `make_movie.sh` to create the time-lapse video composing screencapture images:

    $ ./make_movie.sh

This script produces by default a file called `timelapse.mov` at 24 fps.

# Notes

You need `ffmpeg` to make the time-lapse video.

# Source

http://labs.laan.com/wp/2011/01/how-to-make-time-lapse-screencaptures-of-your-design-work-for-free-mac/