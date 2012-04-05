#!/bin/sh

x=1

for i in $(ls -r -t ./images/*jpg); do
  counter=$(printf %03d $x)
  ln -s ../"$i" ./tmp/img"$counter".jpg
  x=$(($x+1))
done

FRAME_RATE=24
VIDEO_FILENAME=timelapse_`date +%s`.mov

# compile video
ffmpeg -r $FRAME_RATE -i ./tmp/img%03d.jpg -b 15000k $VIDEO_FILENAME