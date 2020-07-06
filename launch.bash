#!/bin/bash
. VERSION
xhost +local:docker
docker run							\
	--rm -it 						\
	-v /dev/log:/dev/log 					\
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro			\
	-v /dev/shm:/dev/shm					\
	-v $(pwd)/c:/c						\
	-p 8888:80/tcp						\
	-e DISPLAY=unix$DISPLAY 				\
	--ipc=host						\
	--name gwbasic						\
	rodolfoap/gwbasic:${VERSION}
