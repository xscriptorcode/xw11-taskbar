#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

VOLUME="$(osascript -e 'output volume of (get volume settings)')"
MUTED="$(osascript -e 'output muted of (get volume settings)')"

if [ "$MUTED" = "true" ]; then
  sketchybar --set volume.popup.mute \
    icon=$ICON_VOLUME_MUTED \
    label="Muted"
else
  sketchybar --set volume.popup.mute \
    icon="${ICON_VOLUME[3]}" \
    label="${VOLUME}%"
fi

sketchybar --animate tanh 10 --set volume_icon popup.drawing=toggle
