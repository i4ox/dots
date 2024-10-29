export DOTFILES="$HOME/DOTS"

source $HOME/.config/zsh/env.zsh --source_only
source $HOME/.config/zsh/cmd.zsh --source_only
source $HOME/.config/zsh/aliases.zsh --source_only
source $HOME/.config/zsh/zap.zsh --source_only
source $HOME/.config/zsh/hooks.zsh --source_only

setopt extended_glob
setopt BASH_REMATCH

if [[ $CURSOR_TYPE == "ibeam" ]]; then
  ibeam_cursor
fi

# Кастомные настройки для каждой отдельной машины
if [[ -f "$DOTFILES/zsh/custom.zsh" ]]; then
  source $DOTFILES/zsh/custom.zsh --source_only
fi
