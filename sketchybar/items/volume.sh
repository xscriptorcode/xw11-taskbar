#!/bin/bash

volume_icon=(
  icon=$ICON_VOLUME
  icon.color=$(getcolor orange)
  icon.padding_right=0
  icon.font="$FONT:Regular:14"
  label.drawing=off
  popup.align=right
  background.padding_left=2
  background.padding_right=2
  click_script="$PLUGIN_DIR/volume_popup.sh"
  --subscribe volume volume_change
)

volume_slider=(
  updates=on
  icon.drawing=off
  label.drawing=off
  padding_left=0
  padding_right=0
  background.height=22
  background.corner_radius=6
  background.color=$TRANSPARENT
  slider.background.color=$(getcolor white 25)
  slider.background.corner_radius=12
  slider.background.height=6
  slider.highlight_color=$HIGHLIGHT
  script="$PLUGIN_DIR/volume.sh"
  --subscribe volume mouse.clicked
)

sketchybar \
  --add slider volume right \
  --set volume "${volume_slider[@]}" \
  --add item volume_icon right \
  --set volume_icon "${volume_icon[@]}" \
  --add item volume.popup.mute popup.volume_icon \
  --set volume.popup.mute "${menu_item_defaults[@]}" \
    icon=$ICON_VOLUME_MUTED \
    icon.color=$(getcolor orange) \
    label="Mute / Unmute" \
    click_script="osascript -e 'set volume output muted not (output muted of (get volume settings))'; sketchybar --set volume_icon popup.drawing=off" \
  --add item volume.popup.settings popup.volume_icon \
  --set volume.popup.settings "${menu_item_defaults[@]}" \
    icon=$ICON_SETTINGS \
    icon.color=$ICON_COLOR \
    label="Sound Settings" \
    click_script="open 'x-apple.systempreferences:com.apple.Sound-Settings.extension'; sketchybar --set volume_icon popup.drawing=off"
