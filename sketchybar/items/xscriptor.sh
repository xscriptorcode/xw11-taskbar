#!/bin/bash

sketchybar --add item xscriptor left \
  --set xscriptor icon="$ICON_X" \
    icon.font="$FONT:Bold:16" \
    icon.color=$HIGHLIGHT \
    label="Xscriptor" \
    label.font="$FONT:Bold:11" \
    label.color=$LABEL_COLOR \
    background.padding_left=2 \
    background.padding_right=4
