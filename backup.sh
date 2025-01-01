#! /usr/bin/bash
# Auto Back up the dotfiles.
$cumtom_commit_message=$1 # optional commit messages

backup=./
# inactivated config files
# cp ~/.zshrc $backup
# cp ~/.tmux.conf $backup
# cp ~/.config/kitty/kitty.conf $backup
# cp ~/.hyper.js $backup
# cp ~/.config/starship.toml $backup

cp ~/.config/nvim $backup -r
cp ~/.config/wezterm $backup -r
cp ~/.config/fish $backup -r
cp ~/.gitconfig $backup
cp ~/.fonts $backup -r
cp ~/.config/zed $backup -r
cp ~/.config/niri $backup -r
cp ~/.config/waybar $backup -r
cp ~/.config/mako $backup -r
cp ~/.config/ghostty $backup -r

echo "dotfiles copied"

git add .
git commit -a -m `date --iso-8601=seconds $cumtom_commit_message`
git push --all

echo "Backup Finished"
