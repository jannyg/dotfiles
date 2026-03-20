#!/bin/bash

# Create nvim config directory
mkdir -p ~/.config
ln -sfn "$PWD/nvim" ~/.config/nvim

# Create tmux/tmuxinator setup
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf
ln -sfn "$PWD/tmuxinator" ~/.config/tmuxinator

# Setup Ghostty config symlink
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty/
ln -sf "$PWD/.config/ghostty/config.ghostty" ~/Library/Application\ Support/com.mitchellh.ghostty/config.ghostty

# Setup zsh configurations
mkdir -p ~/.zsh
for f in "$PWD"/.zsh/*.zsh; do
    ln -sf "$f" ~/.zsh/"$(basename "$f")"
done

# Create cursor setup

# Create gitconfig
ln -sf "$PWD/.gitconfig" ~/.gitconfig
ln -sf "$PWD/.gitignore" ~/.gitignore

# Create curl config
ln -sf "$PWD/.curlrc" ~/.curlrc
# Create wget config
ln -sf "$PWD/.wgetrc" ~/.wgetrc
# Create vim config
ln -sf "$PWD/.vimrc" ~/.vimrc
ln -sfn "$PWD/.vim" ~/.vim
# Create screen config
ln -sf "$PWD/.screenrc" ~/.screenrc

# Setup aliases
ln -sf "$PWD/.aliases" ~/.aliases

# Setup vscode ai instructions
mkdir -p ~/Library/Application\ Support/Code/User/prompts/
ln -sf "$PWD/.vscode/.instructions.md" ~/Library/Application\ Support/Code/User/prompts/.instructions.md

# Pingcheck tool
src="$PWD/tools/pingcheck.sh"; dest="$HOME/pingcheck.sh"; [ -e "$src" ] || { echo "Missing $src"; exit 1; }; { [ -e "$dest" ] || [ -L "$dest" ]; } && { echo "Skipped: $dest already exists"; } || ln -s "$src" "$dest"
