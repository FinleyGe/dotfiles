#! /usr/bin/bash
# Auto Back up the dotfiles.
$cumtom_commit_message=$1 // optional

backup=./
timeNow=`date --iso-8601=seconds`
cp ~/.config/nvim $backup -r
cp ~/.config/wezterm/wezterm.lua $backup
cp ~/.zshrc $backup
cp ~/.tmux.conf $backup
cp ~/.config/kitty/kitty.conf $backup
cp ~/.hyper.js $backup
cp ~/.config/fish $backup -r
echo dotfiles copied

git add .
git commit -a -m $timeNow $custom_commit_message
git push
