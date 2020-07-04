#!/bin/bash
. VERSION
sudo docker build -t rodolfoap/gwbasic:${VERSION} .
