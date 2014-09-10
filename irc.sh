#!/bin/sh
 
function irc
{
  BASE="$HOME"
  cd $BASE
 
  tmux start-server
  tmux new-session -d -s irc -n vim
  #tmux new-window -t irc:1 -n weechat
  #tmux new-window -t irc:2 -n glances
  tmux split-window -h -p 50 -t 0 glances
  tmux select-window -t t glances:1
  tmux split-window -v -p 50 -t 1 ncmpcpp
 # tmux new-window -t irc:3 -n ncmpcpp
 
  tmux send-keys -t irc:0 "cd $BASE; ssh jan@404.no" C-m
  tmux send-keys -t irc:1 "cd $BASE; glances" C-m
  tmux send-keys -t irc:2 "cd $BASE; ncmpcpp" C-m
 
  tmux select-window -t irc:0
  tmux attach-session -t irc
}