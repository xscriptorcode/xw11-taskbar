#!/bin/bash

source "$CONFIG_DIR/icons.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

if [[ "$CHARGING" != "" ]]; then
  ICON=$ICON_BATTERY_CHARGING
else
  ICON=$ICON_BATTERY
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
