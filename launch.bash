#!/bin/bash
. VERSION
docker run 	 					\
	--rm -it 					\
	-v /dev/log:/dev/log 				\
	--name debian10-infra				\
	rodolfoap/gwbasic:${VERSION}
