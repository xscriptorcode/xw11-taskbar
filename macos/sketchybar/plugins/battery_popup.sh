#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1 | head -1)"
STATUS="$(pmset -g batt | grep -o 'AC Power\|Battery Power')"
HEALTH="$(system_profiler SPBatteryDataType 2>/dev/null | grep 'Condition' | awk '{print $2}')"
CYCLES="$(system_profiler SPBatteryDataType 2>/dev/null | grep 'Cycle Count' | awk '{print $3}')"

if [ "$STATUS" = "AC Power" ]; then
  sketchybar --set battery.popup.status \
    icon=$ICON_BATTERY_CHARGING \
    label="Charging  ${PERCENTAGE}%"
else
  sketchybar --set battery.popup.status \
    icon=$ICON_BATTERY \
    label="Discharging  ${PERCENTAGE}%"
fi

sketchybar --set battery.popup.health \
  label="Health: ${HEALTH:-N/A}"

sketchybar --set battery.popup.cycles \
  label="Cycles: ${CYCLES:-N/A}"

sketchybar --animate tanh 10 --set battery popup.drawing=toggle
