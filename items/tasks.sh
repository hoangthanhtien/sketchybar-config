#!/bin/sh

COLOR="$WHITE"
sketchybar --add event task_update
sketchybar --add item task right \
	--set task \
	update_freq=3 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.padding_right=10 \
	label.color="$COLOR" \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=5 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/task.sh" \
	click_script="task 1 done &> /dev/null; sketchybar --trigger task_update"

sketchybar --subscribe task task_update system_woke
