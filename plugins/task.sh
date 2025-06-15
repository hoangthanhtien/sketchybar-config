#!/usr/bin/env bash

# --- Configuration ---
# Set the maximum length for a task description before it gets truncated.
# Set to 0 to disable truncation.
MAX_LENGTH=45

# --- Script Logic ---

# Get the description of the task with ID 1.
# We redirect stderr to /dev/null to hide the "No task with ID 1." error if it occurs.
DESCRIPTION=$(task _get $(task list limit:1 | awk 'NR==4 {print $1}').description 2>/dev/null)

# Check if a description was returned.
if [[ -z "$DESCRIPTION" ]]; then
  # No task with ID 1 was found.
  sketchybar --set "$NAME" icon="✅" label="All Done!"
else
  # A task was found, so we display it.
  # Truncate the description if it's longer than MAX_LENGTH.
  if [[ "$MAX_LENGTH" -gt 0 && ${#DESCRIPTION} -gt $MAX_LENGTH ]]; then
    DESCRIPTION="$(echo "$DESCRIPTION" | cut -c 1-$MAX_LENGTH)..."
  fi
  # SF Symbol for a task list: 􀃊 (list.bullet)
  sketchybar --set "$NAME" icon="☑️" label="$DESCRIPTION"
fi
