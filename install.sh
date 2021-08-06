#!/bin/zsh

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

mkdir -p ~/.config
ln -s ~/dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/config/nvim/dein.toml ~/.config/nvim/dein.toml
