#!/usr/bin/env bash

# Imports
source ./bin/functions.sh

# GLOBALS
GO_BACK=$(pwd)

# Symlink Brewfile to homedir
echo -n "Backing up and copying Brewfile to homedir..."
backup_and_copy Brewfile brew
echo "DONE"

# Symlink dotfiles
echo -n "Backing up and copying dotfiles..."
backup_and_copy (bash_profile bashrc bash_aliases) dotfiles
echo "DONE"

# Symlink Pipfile to homedir
echo -n "Backing up and copying Pipfiles to homedir..."
backup_and_copy (Pipfile Pipfile.lock) python
echo "DONE"

# Install Command Line Tools
echo -n "Installing XCode Command Line Tools..."
xcode-select --install
echo "DONE"

# Install Homebrew
echo -n "Installing Brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "DONE"

# Install applications with Brew
echo -n "Installing applications from Brewfile..."
cd ./brew/ && brew bundle && cd ${GO_BACK}
echo "DONE"

# Set up python environment
echo -n "Setting up python environment..."
cd ~ && pipenv install && cd ${GO_BACK}
echo "DONE"

# Copy VSCode settings
echo -n "Copying vscode settings..."
cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "DONE"
