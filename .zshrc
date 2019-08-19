# コマンド補完
autoload -U compinit
compinit

# コマンド訂正
setopt correct

# vimキーバインド
bindkey -v

# 他のターミナルとヒストリーを共有
setopt share_history
# ヒストリーに重複を表示しない
setopt histignorealldups
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 補完後、メニュー選択モードになり矢印キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+nで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500 # cdrの履歴を保存する個数
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both


##########################
# PLUGIN
##########################
source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug "zsh-users/zaw", from:github
# Ctrl-R でコマンドの履歴を開く
# Ctrl-B でブランチを開く
if zplug check zsh-users/zaw; then
    bindkey '^R' zaw-history
    bindkey '^@' zaw-cdr
    bindkey '^B' zaw-git-branches
    bindkey '^F' zaw-fasd-files
    bindkey '^D' zaw-fasd-directories
fi

# fasd の初期化
eval "$(fasd --init posix-alias zsh-hook)"

if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose
##########################

