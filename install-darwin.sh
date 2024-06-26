#!/bin/bash

echo -e "\033[1;32mStarting the development environment setup...\033[0m"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo -e "\033[1;33mHomebrew is not installed. Installing now...\033[0m"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "\033[1;32mHomebrew is already installed.\033[0m"
fi

# Install packages from Brewfile
echo -e "\033[1;34mInstalling packages from Brewfile...\033[0m"
brew bundle --file ./Brewfile

# Backup existing Neovim config if it exists
if [ -d "$HOME/.config/nvim" ]; then
    echo -e "\033[1;33mBacking up existing Neovim config...\033[0m"
    mv $HOME/.config/nvim $HOME/.config/nvim.backup.$(date +%Y%m%d%H%M)
fi

# Clone the Neovim configuration repository
echo -e "\033[1;35mCloning Neovim config from git@github.com:igorsheg/nvim.git...\033[0m"
git clone git@github.com:igorsheg/nvim.git $HOME/.config/nvim

# Install Neovim plugins
echo -e "\033[1;32mInstalling Neovim plugins...\033[0m"
nvim --headless -c 'Lazy install' -c 'quitall'

echo -e "\033[1;32m\033[1mNeovim is set up successfully.\033[0m"
echo -e "\033[1;37m\033[1mNext Steps:\033[0m"
echo -e "1. Open Neovim with the command: nvim"
echo -e "2. Explore your new development environment."
echo -e "3. Customize your setup by modifying the files in ~/.config/nvim."
echo -e "4. Use the command
