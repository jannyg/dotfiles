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
