#!/bin/bash

brew=(
  icon=$ICON_PACKAGE
  icon.color=$(getcolor cyan)
  icon.font="$FONT:Regular:13"
  label.font="$FONT:Medium:10"
  update_freq=3600
  popup.align=right
  background.padding_left=2
  background.padding_right=2
  script="$PLUGIN_DIR/brew.sh"
  click_script="$PLUGIN_DIR/brew_click.sh"
  --subscribe brew mouse.clicked
)

sketchybar \
  --add item brew right \
  --set brew "${brew[@]}" \
  --add item brew.popup.top popup.brew \
  --set brew.popup.top "${menu_item_defaults[@]}" \
    icon=$ICON_PACKAGE \
    icon.color=$(getcolor cyan) \
    label="Up to date" \
  --add item brew.popup.bottom popup.brew \
  --set brew.popup.bottom "${menu_item_defaults[@]}" \
    icon=$ICON_SETTINGS \
    icon.color=$ICON_COLOR \
    label="Run brew upgrade" \
    click_script="open -a Terminal; sketchybar --set brew popup.drawing=off"
