#!/bin/bash

source "$CONFIG_DIR/icons.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  case "$INFO" in
    "kitty" | "iTerm2" | "Terminal" | "WezTerm" | "Alacritty") ICON=$ICON_TERM ;;
    "Safari" | "Safari Technology Preview") ICON=$ICON_WEB ;;
    "Google Chrome" | "Google Chrome Canary" | "Chromium" | "Brave Browser" | "Brave Browser Beta" | "Opera" | "Vivaldi" | "Arc") ICON=$ICON_WEB ;;
    "Firefox" | "Firefox Developer Edition" | "Firefox Nightly") ICON=$ICON_WEB ;;
    "Visual Studio Code" | "VSCodium") ICON=$ICON_DEV ;;
    "IntelliJ IDEA" | "IntelliJ IDEA Ultimate" | "PyCharm" | "GoLand" | "WebStorm") ICON=$ICON_DEV ;;
    "Xcode") ICON=$ICON_DEV ;;
    "Finder") ICON=$ICON_FINDER ;;
    "Mail" | "Outlook") ICON=$ICON_MAIL ;;
    "Messages") ICON=$ICON_CHAT ;;
    "Spotify") ICON=$ICON_SPOTIFY ;;
    "Discord") ICON=$ICON_DISCORD ;;
    "Slack") ICON=$ICON_SLACK ;;
    "System Settings" | "System Preferences") ICON=$ICON_SETTINGS ;;
    "Calendar") ICON=$ICON_CALENDAR ;;
    "Notes") ICON=$ICON_NOTES ;;
    "Photos") ICON=$ICON_PHOTOS ;;
    "App Store") ICON=$ICON_DEV ;;
    "Preview") ICON=$ICON_PREVIEW ;;
    "Activity Monitor") ICON=$ICON_CPU ;;
    "Calculator") ICON=$ICON_CALC ;;
    *) ICON=$ICON_APP ;;
  esac

  sketchybar --set "$NAME" icon="$ICON" label="$INFO"
fi
