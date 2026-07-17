#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.macosx"

echo "==> Uninstalling Xscriptor macOS dotfiles ..."

echo "  -> Stopping SketchyBar ..."
brew services stop sketchybar 2>/dev/null || true

echo "  -> Removing configs ..."
rm -rf "$CONFIG_DIR/sketchybar"
rm -f "$CONFIG_DIR/aerospace/aerospace.toml"

echo "  -> Removing dotfiles repo ..."
rm -rf "$DOTFILES_DIR"

echo "  -> Uninstalling packages ..."
brew uninstall sketchybar aerospace 2>/dev/null || true

echo ""
echo "==> Done."
