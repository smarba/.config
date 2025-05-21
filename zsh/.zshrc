# Load custom aliases if they exist
[ -f ~/.config/zsh/.aliases ] && source ~/.config/zsh/.aliases


## LOAD Exports
# Load colors in terminal
export CLICOLOR=1            # enables color output
export COLORTERM=truecolor   # makes --color=auto work properly
export LSCOLORS="GxFxCxDxBxegedabagaced"
# Load 1Password SSH Agent either GUI or CLI
if [ -S "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]; then
  export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
else
  eval "$(op ssh-agent)"
fi



# === Custom ZSH Enhancements ===

# Enable up/down arrow history prefix search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search


##############################
#   Tab Completion           #
##############################

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Show completion menu immediately
zstyle ':completion:*' menu select

# Use vi keybindings (Not being used for now)
# bindkey -v

autoload -U colors && colors	      # colours
autoload -U compinit && compinit    # basic completion

# 1Password CLI Completion
eval "$(op completion zsh)"; compdef _op op

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
