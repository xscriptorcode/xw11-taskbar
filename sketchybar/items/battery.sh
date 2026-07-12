#!/bin/bash

battery=(
  icon=$ICON_BATTERY
  icon.color=$(getcolor yellow)
  icon.font.size=14
  icon.padding_right=2
  label.font="$FONT:Medium:10"
  update_freq=120
  popup.align=right
  background.padding_left=2
  background.padding_right=4
  script="$PLUGIN_DIR/battery.sh"
  click_script="$PLUGIN_DIR/battery_popup.sh"
  --subscribe battery power_source_change system_woke
)

sketchybar \
  --add item battery right \
  --set battery "${battery[@]}" \
  --add item battery.popup.status popup.battery \
  --set battery.popup.status "${menu_item_defaults[@]}" \
    icon=$ICON_BATTERY_CHARGING \
    icon.color=$(getcolor yellow) \
  --add item battery.popup.health popup.battery \
  --set battery.popup.health "${menu_item_defaults[@]}" \
    icon=$ICON_SETTINGS \
    icon.color=$(getcolor yellow) \
  --add item battery.popup.cycles popup.battery \
  --set battery.popup.cycles "${menu_item_defaults[@]}" \
    icon=$ICON_REFRESH \
    icon.color=$(getcolor yellow) \
  --add item battery.popup.settings popup.battery \
  --set battery.popup.settings "${menu_item_defaults[@]}" \
    icon=$ICON_SETTINGS \
    icon.color=$ICON_COLOR \
    label="Battery Settings" \
    click_script="open 'x-apple.systempreferences:com.apple.Battery-Settings.extension'; sketchybar --set battery popup.drawing=off"
