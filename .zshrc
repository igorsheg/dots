# Set the default editor and visual editor
export EDITOR='nvim'
export VISUAL='nvim'

# Aliases
alias :q='exit'
alias g='git'
alias ga='git add .'
alias gcm='git commit -m'
alias gcmyl='git commit -m "chore(repo): update yarn.lock"'
alias gp='git push'
alias gpl='git pull'
alias l='eza -lag --git --icons --sort=type'
alias la='eza -lag --git --icons --sort=type'
alias lg='lazygit'
alias ll='eza -l --git --icons --sort=type'
alias lsa='eza -lag --git --icons --sort=type'
alias vid='neovide'
alias vif='nvim +"Telescope find_files theme=ivy preview=false no_ignore=false"'
alias yb='yarn build'
alias ys='yarn start'
alias yt='yarn test'

# Custom Functions
vit() {
  nvim -c terminal -c startinsert
}

open-worksapce-finder() {
  fzf-workspaces
}

open-finder() {
  tmux-sessionizer
}

open-home() {
  tmux-sessionizer "$HOME"
}

# Environment Variables
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"
export PUPPETEER_EXECUTABLE_PATH=$(which chromium)

# Extend PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Key Bindings
bindkey '^f' open-finder
bindkey '^h' open-home
bindkey '^p' open-worksapce-finder

# Check if terminal is interactive
if [[ $- == *i* ]]; then
  # Load starship prompt, if available
  if [[ -x "$(command -v starship)" ]]; then
    eval "$(starship init zsh)"
  fi
fi
