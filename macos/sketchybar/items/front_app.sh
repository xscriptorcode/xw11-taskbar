#!/bin/bash

sketchybar --add item front_app left \
  --set front_app icon.drawing=on \
    icon.font="$FONT:Regular:14" \
    icon.color=$(getcolor red) \
    label.font="$FONT:Bold:11" \
    label.color=$LABEL_COLOR \
    background.padding_left=2 \
    background.padding_right=6 \
    script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched
