#!/bin/sh

DEBUG="--gst-debug=shmsink:TRACE"

# Capabilities:
# /GstPipeline:pipeline0/GstShmSink:shmsink0.GstPad:sink: caps = video/x-raw, format=(string)I420, width=(int)320, height=(int)240, framerate=(fraction)30/1, multiview-mode=(string)mono, pixel-aspect-ratio=(fraction)1/1, interlace-mode=(string)progressive

gst-launch-1.0 ${DEBUG} -v videotestsrc ! shmsink socket-path=./socket shm-size=60000000
