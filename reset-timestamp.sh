#!/bin/sh

# Set the timestamp of all files in the working directory to 01/01/2000 00:00
find . -exec touch -t 0001010000 {} \;
