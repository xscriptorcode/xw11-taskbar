#!/bin/bash

X=(
  blue "#5ad4e6"
  teal "#5ad4e6"
  cyan "#5ad4e6"
  grey "#121212"
  green "#7bd88f"
  yellow "#fce566"
  orange "#fd9353"
  red "#fc618d"
  purple "#948ae3"
  maroon "#fc618d"
  black "#000000"
  trueblack "#000000"
  white "#f7f1ff"
)

COLORS=("${X[@]}")

getcolor() {
  local COLOR_NAME=$1
  local OPACITY=${2:-100}
  local COLOR=""

  for ((i = 0; i < ${#COLORS[@]}; i += 2)); do
    if [[ "${COLORS[i]}" == "$COLOR_NAME" ]]; then
      COLOR="${COLORS[i + 1]}"
      break
    fi
  done

  if [[ -z $COLOR ]]; then
    echo "Invalid color name: $COLOR_NAME" >&2
    return 1
  fi

  printf "0x%02X%s" "$(((OPACITY * 255) / 100))" "${COLOR:1}"
}

BAR_COLOR=$(getcolor black)
BAR_BORDER_COLOR=$(getcolor black 0)
HIGHLIGHT=$(getcolor purple)
HIGHLIGHT_75=$(getcolor purple 75)
HIGHLIGHT_50=$(getcolor purple 50)
HIGHLIGHT_25=$(getcolor purple 25)
HIGHLIGHT_10=$(getcolor purple 10)
ICON_COLOR=$(getcolor white)
ICON_COLOR_INACTIVE=$(getcolor white 25)
LABEL_COLOR=$(getcolor white 75)
LABEL_COLOR_NEGATIVE=$(getcolor black)
POPUP_BACKGROUND_COLOR=$(getcolor black 90)
POPUP_BORDER_COLOR=$(getcolor black 0)
SHADOW_COLOR=$(getcolor black)
TRANSPARENT=$(getcolor black 0)
