# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PATH="/usr/local/bin:$PATH"

# For C/C++
export PATH="$HOME/.local/bin:$PATH"
export CPATH="$CPATH:$HOME/.local/include"
export CPATH="$CPATH:/usr/local/include"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# For Rust
source "$HOME/.cargo/env"

