#!/bin/sh

DEBUG="--gst-debug=shmsink:TRACE"

# Download the video file:
# wget http://linode.boundarydevices.com/videos/trailer_1080p_h264_mp3.avi

# It looks that around 64MB shared memory is required to share the raw video
gst-launch-1.0 ${DEBUG} -v filesrc location=trailer_1080p_h264_mp3.avi ! \
	avidemux ! h264parse ! avdec_h264 ! \
	shmsink socket-path=./socket shm-size=64000000
