# Screen capture time-lapse

A simple script to make time-lapse videos of your work.

Using it is as simple as following those two steps.

## Examples

Me and @pinakes working on [Draw!](http://drawbang.com): about 2 hours of design and development.

* Design process: [http://www.youtube.com/watch?v=iO94sUJoG1s](http://www.youtube.com/watch?v=iO94sUJoG1s)
* Develpment process: [http://www.youtube.com/watch?v=VXXhDqfO4qA](http://www.youtube.com/watch?v=VXXhDqfO4qA)

## Step 1

Run `capture.sh` to start grabbing your screen:

```bash
$ ./capture.sh
```

When you want to make a break just stop the process using `ctrl-c` and restart when you're done.

Default capture rate is one screenshot every 4 seconds.

## Step 2

Run `make_movie.sh` to create the time-lapse video composing screencapture images:

```bash
$ ./make_movie.sh
```

This script produces by default a file called `timelapse_<unix-timestamp>.mov` at 24 fps.

## Step 3

Delete screen captures:

```bash
$ ./clean_up.sh
```

# Notes

1. You need `ffmpeg` to make the time-lapse video.
1. If you're running this script on Linux you need to install `imagemagick` to take screenshoots.

# Inspired by

[http://labs.laan.com/wp/2011/01/how-to-make-time-lapse-screencaptures-of-your-design-work-for-free-mac/](http://labs.laan.com/wp/2011/01/how-to-make-time-lapse-screencaptures-of-your-design-work-for-free-mac/)