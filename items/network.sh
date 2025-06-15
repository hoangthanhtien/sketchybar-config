#!/bin/bash

# Get the primary network interface (change 'en0' if needed)
INTERFACE="en0"

# Get initial byte counts
initial_bytes_in=$(ifconfig $INTERFACE | grep "bytes" | awk '{print $2}')
initial_bytes_out=$(ifconfig $INTERFACE | grep "bytes" | awk '{print $5}')

# Wait for one second
sleep 1

# Get new byte counts
new_bytes_in=$(ifconfig $INTERFACE | grep "bytes" | awk '{print $2}')
new_bytes_out=$(ifconfig $INTERFACE | grep "bytes" | awk '{print $5}')

# Calculate the speed in kilobytes per second
speed_in=$(echo "scale=2; ($new_bytes_in - $initial_bytes_in) / 1024" | bc)
speed_out=$(echo "scale=2; ($new_bytes_out - $initial_bytes_out) / 1024" | bc)

# Format the output for SketchyBar
sketchybar --set $NAME label="↓ ${speed_in} kB/s ↑ ${speed_out} kB/s"
