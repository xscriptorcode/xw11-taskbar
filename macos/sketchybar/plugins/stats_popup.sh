#!/bin/bash

CPU=$(top -l 1 -n 0 2>/dev/null | grep 'CPU usage' | awk '{print $3}' | sed 's/%//')
RAM_TOTAL=$(( $(sysctl -n hw.memsize 2>/dev/null) / 1073741824 ))
RAM_USED=$(memory_pressure 2>/dev/null | grep 'System-wide memory free' | awk '{printf "%.1f", 1 - $5/1048576}')
DISK=$(df -h / 2>/dev/null | tail -1 | awk '{print $3, "/", $2, "(" $5 ")"}')

sketchybar --set stats.popup.cpu \
  label="CPU: ${CPU:-0}%"

sketchybar --set stats.popup.ram \
  label="RAM: ${RAM_USED:-0}G / ${RAM_TOTAL:-0}G"

sketchybar --set stats.popup.disk \
  label="Disk: ${DISK:-N/A}"

sketchybar --animate tanh 10 --set stats popup.drawing=toggle
