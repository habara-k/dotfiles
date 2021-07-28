export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export CPATH="$CPATH:$HOME/.local/include"
export CPATH="$CPATH:/usr/local/include"

# alias
alias l='ls -G'
alias la='ls -a -G'

# cdの後にlsを実行
chpwd() { ls -G }

# mkdirとcdを同時実行
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

source "$HOME/.cargo/env"
