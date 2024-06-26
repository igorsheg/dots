# Basic Environment Settings
set -gx EDITOR nvim
set -gx VISUAL nvim
set -g fish_greeting
fish_vi_key_bindings

# Custom Aliases
alias :q exit
alias g git
alias ga 'git add .'
alias gcm 'git commit -m'
alias gcmyl 'git commit -m "chore(repo): update yarn.lock"'
alias gp 'git push'
alias gpl 'git pull'
alias l 'eza -lag --git --icons --sort=type'
alias la 'eza -lag --git --icons --sort=type'
alias lg lazygit
alias ll 'eza -l --git --icons --sort=type'
alias lsa 'eza -lag --git --icons --sort=type'
alias vid neovide
alias vif 'nvim +"Telescope find_files theme=ivy preview=false no_ignore=false"'
alias yb 'yarn build'
alias ys 'yarn start'
alias yt 'yarn test'

# Custom Functions
function vit
    nvim -c terminal -c startinsert
end

function open-worksapce-finder
    fzf-workspaces
end

function open-finder
    tmux-sessionizer
end

function open-home
    tmux-sessionizer $HOME
end

# Key Bindings
bind -M insert \cf open-finder
bind -M default \cf open-finder
bind -M insert \ch open-home
bind -M default \ch open-home
bind -M insert \cp open-worksapce-finder
bind -M default \cp open-worksapce-finder

# Path Extensions
set -U fish_user_paths ~/.local/bin $fish_user_paths
set -Ux fish_user_paths $HOME/.cargo/bin $fish_user_paths
fish_add_path /opt/homebrew/bin

# Environment Variables
set -x PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
set -x PUPPETEER_EXECUTABLE_PATH (which chromium)

# Conditional Initializations
if status is-login
    # Login shell initialization can be done here
end

if status is-interactive
    # Interactive shell initialization
    set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
    set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

    # Check terminal type
    if test "$TERM" != dumb
        # Initialize starship prompt, modify path as needed
        starship init fish | source
    end
end

