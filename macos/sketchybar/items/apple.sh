#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"

sketchybar --add item apple.logo left \
  --set apple.logo icon="$ICON_APPLE" \
    icon.font="$FONT:Regular:17" \
    icon.color=$(getcolor red) \
    label.drawing=off \
    background.drawing=on \
    background.color=$(getcolor black 50) \
    background.corner_radius=16 \
    background.height=28 \
    padding_left=10 \
    padding_right=6 \
    popup.align=left \
    click_script="sketchybar --set apple.logo popup.drawing=toggle" \
  --add item apple.popup.sleep popup.apple.logo \
  --set apple.popup.sleep "${menu_item_defaults[@]}" \
    icon=$ICON_MOON \
    icon.color=$(getcolor purple) \
    label="Sleep" \
    click_script="pmset sleepnow; $POPUP_OFF" \
  --add item apple.popup.logout popup.apple.logo \
  --set apple.popup.logout "${menu_item_defaults[@]}" \
    icon=$ICON_LOGOUT \
    icon.color=$(getcolor yellow) \
    label="Log Out" \
    click_script="osascript -e 'tell app \"System Events\" to log out'; $POPUP_OFF" \
  --add item apple.popup.shutdown popup.apple.logo \
  --set apple.popup.shutdown "${menu_item_defaults[@]}" \
    icon=$ICON_POWER \
    icon.color=$(getcolor red) \
    label="Shut Down" \
    click_script="osascript -e 'tell app \"System Events\" to shut down'; $POPUP_OFF"
