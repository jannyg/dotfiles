#!/bin/bash

# Create nvim config directory

directory=~/.config
if [ -d "$directory" ]
then
    echo "Copying config..."
    cp -a nvim ~/.config/
else
    echo "Folder does not exist. Creating..."
    mkdir ~/.config
    echo "Copying config..."
    cp -a nvim ~/.config/
fi

# Create tmux/tmuxinator setup
cp .tmux.conf ~/
cp -a tmuxinator ~/.config/

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
cp .gitconfig ~/
cp .gitignore ~/

# Create curl config
cp .curlrc ~/
# Create wget config
cp .wgetrc ~/
# Create vim config
cp .vimrc ~/
cp -a .vim ~/
# Create screen config
cp .screenrc ~/

# Setup aliases
cp .aliases ~/

# Setup vscode ai instructions
cp .vscode/.instructions.md ~/Library/Application\ Support/Code/User/prompts/

# Pingcheck tool
src="$PWD/tools/pingcheck.sh"; dest="$HOME/pingcheck.sh"; [ -e "$src" ] || { echo "❌ Missing $src"; exit 1; }; { [ -e "$dest" ] || [ -L "$dest" ]; } && { echo "ℹ️ Skipped: $dest already exists"; } || ln -s "$src" "$dest"