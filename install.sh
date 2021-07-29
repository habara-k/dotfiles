#!/bin/zsh

rm ~/.zprezto/runcoms/zshrc
ln -s ~/dotfiles/zshrc ~/.zprezto/runcoms/zshrc

rm ~/.zprezto/runcoms/zpreztorc
ln -s ~/dotfiles/zpreztorc ~/.zprezto/runcoms/zpreztorc

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

mkdir -p ~/.config
ln -s ~/dotfiles/config/nvim ~/.config/nvim
