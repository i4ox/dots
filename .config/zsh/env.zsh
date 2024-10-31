# GoEnv && Golang
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Utils
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(ssh-agent -s)"

# Mics
export MASON_BIN="$HOME/.local/share/nvim/mason/bin"
export STARSHIP_CONFIG="$DOTFILES/starship/starship.toml"
export PATH="$DOTFILES/bin:$MASON_BIN:$PATH"
export CURSOR_TYPE="ibeam"
