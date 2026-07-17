#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --animate tanh 10 --set "$NAME" \
    background.color=0xc0948ae3 \
    icon.highlight=on
else
  sketchybar --animate tanh 10 --set "$NAME" \
    background.color=0xc0121212 \
    icon.highlight=off
fi
