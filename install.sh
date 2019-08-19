#!/bin/zsh

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir ~/.config
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
