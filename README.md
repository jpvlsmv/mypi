[![Build Status](https://travis-ci.org/jpvlsmv/mypi.svg?branch=master)](https://travis-ci.org/jpvlsmv/mypi)

# Mypi - custom-build image for my raspberry pi zero w

When possible, use cloud (aka Somebody Else's Computer) to create the build
environment, and build the firmware image.

## Usage:
travis-ci will run these on any push.
Basics:
    make build
    make test
    TODO: make image
    TODO: make image-test

Versioning:
    git commit -a -m "yay"
    make {patch,minor,major}-release

## Credits:
General flow based on https://jsandler18.github.io/tutorial

Makefile for Docker based on
https://binx.io/blog/2017/10/07/makefile-for-docker-images/ with some tweaks
