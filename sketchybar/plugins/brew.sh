#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

COUNT=$(brew outdated 2>/dev/null | wc -l | tr -d ' ')

if [ "$COUNT" -gt 0 ]; then
  sketchybar --set "$NAME" label="$COUNT" \
             --set brew.popup.top label="$COUNT outdated"
  sketchybar --animate tanh 10 --set "$NAME" \
    icon.color=$(getcolor yellow)
else
  sketchybar --set "$NAME" label.drawing=off \
             --set brew.popup.top label="Up to date"
  sketchybar --animate tanh 10 --set "$NAME" \
    icon.color=$(getcolor cyan)
fi
