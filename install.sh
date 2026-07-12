#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Xscriptor macOS dotfiles ..."

if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing packages ..."
brew install sketchybar aerospace

if ! fc-list | grep -qi "Hack Nerd Font"; then
  echo "==> Installing Hack Nerd Font ..."
  brew install --cask font-hack-nerd-font
fi

echo "==> Linking sketchybar config ..."
mkdir -p "$CONFIG_DIR/sketchybar"
if [ -d "$CONFIG_DIR/sketchybar" ]; then
  cp -R "$REPO_DIR/sketchybar/"* "$CONFIG_DIR/sketchybar/"
fi

echo "==> Linking aerospace config ..."
mkdir -p "$CONFIG_DIR/aerospace"
if [ -f "$REPO_DIR/aerospace/aerospace.toml" ]; then
  cp "$REPO_DIR/aerospace/aerospace.toml" "$CONFIG_DIR/aerospace/aerospace.toml"
fi

echo "==> Starting services ..."
brew services start sketchybar 2>/dev/null || true
aerospace reload-config 2>/dev/null || true

echo ""
echo "==> Done! Reload Aerospace with Ctrl+Shift+r if needed."
