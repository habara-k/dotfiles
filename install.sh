#!/bin/zsh

DOT_DIRECTORY=$HOME/ghq/github.com/habara-k/dotfiles
ln -snfv $DOT_DIRECTORY/zshrc $HOME/.zshrc
ln -snfv $DOT_DIRECTORY/zshenv $HOME/.zshenv
ln -snfv $DOT_DIRECTORY/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/nvim/lua
#ln -snfv $DOT_DIRECTORY/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -snfv $DOT_DIRECTORY/config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -snfv $DOT_DIRECTORY/config/nvim/lua/plugins.lua $HOME/.config/nvim/lua/plugins.lua
