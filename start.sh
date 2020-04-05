#!/bin/bash

service octoprint start
OUTPUT_LOGFILES+="/dev/null"

touch $OUTPUT_LOGFILES
tail -f $OUTPUT_LOGFILES &
wait