
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

Default capture rate is one screenshot every 4 seconds. This can however be adjusted with the --period command line option.

By default, the screen will be captured regardless of which app you have in focus. When you switch from your Fusion360 session to Music to choose another song, this will be captured. This behaviour can be adjusted with the --app command line option. By providing the name of an app, screen captures will only be made when that specific app is in focus. An example with all options is shown bellow. The --app option is only available on macOS.

```bash
$ ./capture.sh --period 10 --app "Autodesk Fusion 360"
```

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

[http://labs.laan.com/wp/2011/01/how-to-make-time-lapse-screencaptures-of-your-design-work-for-free-mac/](http://labs.laan.com/wp/2011/01/how-to-make-time-lapse-screencaptures-of-your-design-work-for-free-mac/)# Screen capture time-lapse

A simple script to make time-lapse videos of your work.

Using it is as simple as following those two steps.
