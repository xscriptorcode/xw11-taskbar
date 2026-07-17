#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

PADDINGS=6
FONT="Hack Nerd Font"

bar=(
  color=$TRANSPARENT
  position=top
  topmost=on
  sticky=on
  height=36
  padding_left=4
  padding_right=4
  corner_radius=0
  blur_radius=80
  notch_width=170
  margin=12
)

item_defaults=(
  background.corner_radius=16
  background.height=28
  background.color=$(getcolor black 75)
  background.padding_left=$(($PADDINGS / 2))
  background.padding_right=$(($PADDINGS / 2))
  icon.color=$ICON_COLOR
  icon.font="$FONT:Regular:14"
  icon.highlight_color=$HIGHLIGHT
  icon.padding_left=10
  icon.padding_right=4
  label.color=$LABEL_COLOR
  label.font="$FONT:Medium:12"
  label.highlight_color=$HIGHLIGHT
  label.padding_left=4
  label.padding_right=10
  icon.font.size=14
  scroll_texts=on
  updates=when_shown
)

bracket_defaults=(
  background.corner_radius=16
  background.color=$(getcolor black 75)
  background.height=26
)

menu_defaults=(
  popup.blur_radius=32
  popup.background.color=$POPUP_BACKGROUND_COLOR
  popup.background.corner_radius=10
  popup.background.border_width=2
  popup.background.border_color=$(getcolor white 25)
  popup.background.shadow.drawing=on
  popup.background.shadow.color=$SHADOW_COLOR
  popup.background.shadow.angle=90
  popup.background.shadow.distance=64
)

menu_item_defaults=(
  label.font="$FONT:Medium:11"
  padding_left=$PADDINGS
  padding_right=$PADDINGS
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  icon.font.size=12
  background.color=$(getcolor black 50)
  background.height=22
  background.corner_radius=6
  scroll_texts=off
  icon.width=18
  label.color=$LABEL_COLOR
)
