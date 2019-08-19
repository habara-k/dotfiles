##########################
# PATH
##########################
# from Homebrew
export PATH="/usr/local/bin:$PATH"

# tex
export PATH="$PATH:/usr/local/texlive/2018/bin/x86_64-darwin"

export PYTHONIOENCODING='utf-8'

# go
export PATH="$PATH:$HOME/go/bin"
export GOPATH=$HOME/go

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nodebrew
export PATH=/usr/local/var/nodebrew/current/bin:$PATH

##########################


# プロンプト(pure)
autoload -U promptinit; promptinit
prompt pure

# alias
alias l='ls -G'
alias la='ls -a -G'
alias ll='ls -l -G'
alias so='source'
alias mkdir='mkdir -p'

# mkdirとcdを同時実行
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# cdの後にlsを実行
chpwd() { ls -G }
