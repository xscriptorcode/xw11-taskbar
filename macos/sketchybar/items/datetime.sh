#!/bin/bash

date=(
  icon=$ICON_CALENDAR
  icon.color=$(getcolor green)
  icon.font="$FONT:Regular:13"
  label.font="$FONT:Medium:10"
  update_freq=60
  script='sketchybar --set $NAME label="$(date "+%a %d %b")"'
  click_script="open -a Calendar"
  popup.align=right
  background.padding_left=2
  background.padding_right=1
)

clock=(
  "${menu_defaults[@]}"
  icon=$ICON_CLOCK
  icon.color=$(getcolor green)
  icon.font="$FONT:Regular:12"
  label.font="$FONT:Bold:11"
  label.padding_right=6
  update_freq=30
  script='sketchybar --set $NAME label="$(date "+%H:%M")"'
  popup.align=right
  background.padding_left=1
  background.padding_right=2
  click_script="$PLUGIN_DIR/datetime_popup.sh"
)

sketchybar \
  --add item date right \
  --set date "${date[@]}" \
  --add item clock right \
  --set clock "${clock[@]}" \
  --add item clock.popup.date popup.clock \
  --set clock.popup.date "${menu_item_defaults[@]}" \
    icon=$ICON_CALENDAR \
    label="$(date '+%A, %B %d, %Y')" \
  --add item clock.popup.week popup.clock \
  --set clock.popup.week "${menu_item_defaults[@]}" \
    icon=$ICON_CLOCK \
    label="Week $(date '+%V')" \
  --add item clock.popup.doy popup.clock \
  --set clock.popup.doy "${menu_item_defaults[@]}" \
    icon=$ICON_REFRESH \
    label="Day $(date '+%j')"
