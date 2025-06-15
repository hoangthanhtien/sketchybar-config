#!/bin/bash

# Get the MEMORY usage percentage
MEMORY_USAGE=$(top -l 1 | grep -E "^Phys" | awk '{print "Mem: " $2 "/32G"}')

sketchybar --set $NAME label="${MEMORY_USAGE}"
