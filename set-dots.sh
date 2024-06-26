#!/bin/bash

# Define the location of your dotfiles repository
DOTFILES_DIR="$HOME/dotfiles"

# Backup existing dotfiles
echo "Backing up existing dotfiles..."
mkdir -p "$HOME/dotfiles_backup"
cp -R "$HOME/.config/fish" "$HOME/dotfiles_backup/"
cp -R "$HOME/.config/tmux" "$HOME/dotfiles_backup/"
cp "$HOME/.zshrc" "$HOME/dotfiles_backup/" 2>/dev/null || echo ".zshrc does not exist."

# Create necessary directories if they don't exist
echo "Creating necessary directories..."
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.local/bin"

# Copy new dotfiles
echo "Installing new dotfiles..."
cp "$DOTFILES_DIR/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
cp "$DOTFILES_DIR/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
cp "$DOTFILES_DIR/.local/bin/tmux-sessionizer" "$HOME/.local/bin/tmux-sessionizer"

# Ensure all scripts in .local/bin are executable
echo "Setting executable permissions for scripts in .local/bin..."
chmod +x $HOME/.local/bin/*

echo "Dotfiles installation complete!"
