#!/bin/bash

wifi=(
  "${menu_defaults[@]}"
  icon=$ICON_WIFI
  icon.color=$(getcolor cyan)
  icon.padding_right=0
  label.drawing=off
  popup.align=right
  update_freq=30
  script="$PLUGIN_DIR/wifi.sh"
  --subscribe wifi wifi_change
  background.padding_left=2
  background.padding_right=2
)

sketchybar \
  --add item wifi right \
  --set wifi "${wifi[@]}" \
  --add item wifi.ip popup.wifi \
  --set wifi.ip "${menu_item_defaults[@]}" \
    icon=$ICON_WIFI \
    icon.color=$(getcolor cyan) \
    click_script="sketchybar --set wifi popup.drawing=off" \
  --add item wifi.settings popup.wifi \
  --set wifi.settings "${menu_item_defaults[@]}" \
    icon=$ICON_SETTINGS \
    icon.color=$ICON_COLOR \
    label="Network Settings" \
    click_script="open 'x-apple.systempreferences:com.apple.Network-Settings.extension'; sketchybar --set wifi popup.drawing=off"
