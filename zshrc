### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light chrissicool/zsh-256color

zinit light zsh-users/zsh-history-substring-search
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down


# oh-my-zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

# prompt
setopt promptsubst
zinit snippet OMZT::gnzh
zinit light agnoster/agnoster-zsh-theme


# anyframe
zinit light mollifier/anyframe
zstyle ":anyframe:selector:" use fzf-tmux

bindkey '^u' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

bindkey '^r' anyframe-widget-execute-history
bindkey '^b' anyframe-widget-checkout-git-branch
bindkey '^g' anyframe-widget-cd-ghq-repository
bindkey '^i' anyframe-widget-insert-filename
bindkey '^t' anyframe-widget-tmux-attach


# alias
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -lh"


# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history

setopt AUTO_CD

