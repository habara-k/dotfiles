#!/bin/zsh

rm ~/.zprezto/runcoms/zshrc
ln -s ~/dotfiles/zshrc ~/.zprezto/runcoms/zshrc

rm ~/.zprezto/runcoms/zpreztorc
ln -s ~/dotfiles/zpreztorc ~/.zprezto/runcoms/zpreztorc

rm ~/.zprezto/runcoms/zshenv
ln -s ~/dotfiles/zshenv ~/.zprezto/runcoms/zshenv

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

mkdir -p ~/.config
ln -s ~/dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/config/nvim/dein.toml ~/.config/nvim/dein.toml
ln -s ~/dotfiles/config/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
ln -s ~/dotfiles/config/nvim/plugins/coc.vim ~/.config/nvim/plugins/coc.vim
ln -s ~/dotfiles/config/nvim/plugins/defx.vim ~/.config/nvim/plugins/defx.vim
ln -s ~/dotfiles/config/nvim/plugins/fugitive.vim ~/.config/nvim/plugins/fugitive.vim
ln -s ~/dotfiles/config/nvim/plugins/vim-gitgutter.vim ~/.config/nvim/plugins/vim-gitgutter.vim
