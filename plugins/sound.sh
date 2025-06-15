#!/usr/bin/env bash

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [ "$MUTED" != "false" ]; then
	ICON="󰖁"
	VOLUME=0
else
	case ${VOLUME} in
	100) ICON="🔊" ;;
	[5-9]*) ICON="🔉" ;;
	[0-9]*) ICON="🔈" ;;
	*) ICON="🔈" ;;
	esac
	
	# case ${VOLUME} in
	# 100) ICON="" ;;
	# [5-9]*) ICON="" ;;
	# [0-9]*) ICON="" ;;
	# *) ICON="" ;;
	# esac
	# ICON=""
fi

sketchybar -m \
	--set "$NAME" icon=$ICON \
	--set "$NAME" label="$VOLUME%"
