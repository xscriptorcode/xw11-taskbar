#!/bin/bash

set -e

REPO_URL="https://github.com/xscriptor/macosx.git"
DOTFILES_DIR="$HOME/.macosx"
CONFIG_DIR="$HOME/.config"

echo "==> Installing Xscriptor macOS dotfiles ..."

echo "  -> Fetching dotfiles ..."
if [ -d "$DOTFILES_DIR" ]; then
  git -C "$DOTFILES_DIR" pull --ff-only 2>/dev/null || true
else
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

if ! command -v brew &>/dev/null; then
  echo "  -> Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "  -> Installing packages ..."
brew install sketchybar aerospace

if ! fc-list | grep -qi "Hack Nerd Font"; then
  echo "  -> Installing Hack Nerd Font ..."
  brew install --cask font-hack-nerd-font
fi

echo "  -> Installing configs ..."
mkdir -p "$CONFIG_DIR/sketchybar" "$CONFIG_DIR/aerospace"
cp -R "$DOTFILES_DIR/sketchybar/"* "$CONFIG_DIR/sketchybar/"
cp "$DOTFILES_DIR/aerospace/aerospace.toml" "$CONFIG_DIR/aerospace/aerospace.toml"

echo "  -> Starting services ..."
brew services start sketchybar 2>/dev/null || true
aerospace reload-config 2>/dev/null || true

echo ""
echo "==> Done. Reload Aerospace with Ctrl+Shift+r if needed."
