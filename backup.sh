#! /usr/bin/bash
# Auto Back up the dotfiles.
backup=~/project/dotfiles
timeNow=`date --iso-8601=seconds`
cp ~/.config/nvim $backup -r
cp ~/.config/wezterm/wezterm.lua $backup
cp ~/.zshrc $backup
cp ~/.tmux.conf $backup
cp ~/.config/kitty/kitty.conf $backup
cp ~/.hyper.js $backup
echo dotfiles copied

git add .
git commit -a -m $timeNow
