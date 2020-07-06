# GWBasic in a docker container

Find the container here: https://hub.docker.com/r/rodolfoap/gwbasic

## Usage

Just launch the container using the `launch.bash` command:

```
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
```

It will create a `c/dosbox.conf` file. Tweak it as you like.

## Manual

While the container is started, just browse `http://localhost:8888/`

## Credits

* Microsoft releases GWbasic source code: https://devblogs.microsoft.com/commandline/microsoft-open-sources-gw-basic/
* Dosbox build taken from https://github.com/h6w/dosbox-docker
