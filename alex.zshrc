# ========================================
# ZSH CONFIGURATION
# ========================================

# Enable Powerlevel10k instant prompt (must be at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ========================================
# OH-MY-ZSH CONFIGURATION
# ========================================

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins to load
plugins=(
  git
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ========================================
# THEME & PLUGIN SOURCES
# ========================================

# Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Zsh plugins (order matters - autosuggestions before syntax-highlighting)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ========================================
# DEVELOPMENT TOOLS
# ========================================

# ASDF version manager
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# FZF fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ========================================
# ENVIRONMENT VARIABLES
# ========================================

# GPG configuration
export GPG_TTY="$(tty)"

# ========================================
# PATH CONFIGURATION
# ========================================

# Core paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/homebrew/bin:$PATH"

# Database tools
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Azure CLI
export PATH="/opt/homebrew/Cellar/azure-cli/2.64.0/bin:$PATH"

# ========================================
# ALIASES
# ========================================

# Development shortcuts
alias c='code'
alias tf='terraform'