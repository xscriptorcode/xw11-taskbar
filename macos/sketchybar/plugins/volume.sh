#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
  MUTED="$(osascript -e 'output muted of (get volume settings)')"

  if [ "$MUTED" = "true" ]; then
    ICON=$ICON_VOLUME_MUTED
  elif [ "$VOLUME" -ge 70 ]; then
    ICON="${ICON_VOLUME[3]}"
  elif [ "$VOLUME" -ge 40 ]; then
    ICON="${ICON_VOLUME[2]}"
  elif [ "$VOLUME" -ge 10 ]; then
    ICON="${ICON_VOLUME[1]}"
  else
    ICON="${ICON_VOLUME[0]}"
  fi

  sketchybar --set volume_icon icon="$ICON" \
             --set volume slider.percentage="$VOLUME"
fi
