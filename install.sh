#!/bin/zsh

DOT_DIRECTORY=$HOME/ghq/github.com/habara-k/dotfiles
ln -snfv $DOT_DIRECTORY/zshrc $HOME/.zshrc
ln -snfv $DOT_DIRECTORY/zshenv $HOME/.zshenv
ln -snfv $DOT_DIRECTORY/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/nvim
ln -snfv $DOT_DIRECTORY/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -snfv $DOT_DIRECTORY/config/nvim/dein.toml $HOME/.config/nvim/dein.toml
