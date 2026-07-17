#!/bin/bash

for sid in 1 2 3 4 5 6 7 8 9; do
  sketchybar --add item space."$sid" left \
    --subscribe space."$sid" aerospace_workspace_change \
    --set space."$sid" \
      icon="$sid" \
      icon.padding_left=6 \
      icon.padding_right=6 \
      icon.highlight_color=$(getcolor yellow) \
      icon.color=$ICON_COLOR_INACTIVE \
      background.height=20 \
      background.corner_radius=10 \
      background.color=$(getcolor black 50) \
      background.drawing=on \
      label.drawing=off \
      click_script="aerospace workspace $sid" \
      script="$PLUGIN_DIR/space.sh $sid"
done
