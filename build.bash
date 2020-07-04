#!/bin/bash
. VERSION
docker build -t rodolfoap/gwbasic:${VERSION} .
