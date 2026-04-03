#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES_DIR/$1"
  local dst="$HOME/$1"

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "  backup: $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "  linked: $dst -> $src"
}

echo "Installing dotfiles..."

# .vimrc
link .vimrc

# .config files
link .config/fish
link .config/kitty
link .config/nvim
link .config/starship.toml

echo "Done!"
