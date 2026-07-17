#!/bin/bash

CPU=$(top -l 1 -n 0 2>/dev/null | grep 'CPU usage' | awk '{print $3}' | sed 's/%//')
RAM=$(memory_pressure 2>/dev/null | grep 'System-wide memory free' | awk '{printf "%d", $5/256}')
DISK=$(df -h / 2>/dev/null | tail -1 | awk '{print $5}')

sketchybar --set "$NAME" \
  label="CPU ${CPU:-0}%"
