#!/bin/bash

sketchybar --set clock.popup.date \
  label="$(date '+%A, %B %d, %Y')"

sketchybar --set clock.popup.week \
  label="Week $(date '+%V')"

sketchybar --set clock.popup.doy \
  label="Day $(date '+%j') of $(date '+%Y' | date -f - '+%j' 2>/dev/null || echo '365')"

sketchybar --animate tanh 10 --set clock popup.drawing=toggle
