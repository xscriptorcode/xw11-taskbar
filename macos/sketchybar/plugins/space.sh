#!/bin/bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --animate tanh 10 --set "$NAME" \
    background.color=$(getcolor purple 50) \
    icon.color=$ICON_COLOR \
    icon.highlight=on
else
  sketchybar --animate tanh 10 --set "$NAME" \
    background.color=$(getcolor black 50) \
    icon.color=$ICON_COLOR_INACTIVE \
    icon.highlight=off
fi
