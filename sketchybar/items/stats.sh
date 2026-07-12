#!/bin/bash

stats=(
  icon=$ICON_CPU
  icon.color=$(getcolor green)
  icon.font="$FONT:Regular:12"
  label.font="$FONT:Medium:9"
  update_freq=5
  popup.align=right
  background.padding_left=2
  background.padding_right=2
  script="$PLUGIN_DIR/stats.sh"
  click_script="$PLUGIN_DIR/stats_popup.sh"
  --subscribe stats mouse.clicked
)

sketchybar \
  --add item stats right \
  --set stats "${stats[@]}" \
  --add item stats.popup.cpu popup.stats \
  --set stats.popup.cpu "${menu_item_defaults[@]}" \
    icon=$ICON_CPU \
    icon.color=$(getcolor green) \
  --add item stats.popup.ram popup.stats \
  --set stats.popup.ram "${menu_item_defaults[@]}" \
    icon=$ICON_RAM \
    icon.color=$(getcolor yellow) \
  --add item stats.popup.disk popup.stats \
  --set stats.popup.disk "${menu_item_defaults[@]}" \
    icon=$ICON_DISK \
    icon.color=$(getcolor orange)
