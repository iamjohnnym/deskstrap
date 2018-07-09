#!/usr/bin/env bash

# GLOBALS
GO_BACK=$(pwd)

# Install Command Line Tools
echo -n "Installing XCode Command Line Tools..."
xcode-select --install > /dev/null
echo "DONE"

# Install Homebrew
echo -n "Installing Brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
echo "DONE"

# Symlink Brewfile to homedir
echo -n "Linking Brewfile to homedir..."
ln -s ./brew/Brewfile ~/Brewfile
echo "DONE"

# Install applications with Brew
echo -n "Installing applications from Brewfile..."
cd ./brew/ && brew bundle > /dev/null && cd ${GO_BACK}
echo "DONE"

# Install pipenv
echo -n "Installing pipenv on system..."
sudo pip install pipenv
echo "DONE"

# Symlink Pipfile to homedir
echo -n "Installing pipenv on system..."
ln -s ./python/Pipfile ~/Pipfile
ln -s ./python/Pipfile.lock ~/Pipfile.lock
echo "DONE"

# Set up python environment
echo -n "Setting up python environment..."
cd ~ && pipenv install && cd ${GO_BACK}
echo "DONE"

# Symlink dotfiles
echo -n "Symlinking dotfiles..."
mv ~/.bash_profile{,.bak}
mv ~/.bashrc{,.bak}
ln -s ./dotfiles/bash_aliases ~/.bash_aliases
ln -s ./dotfiles/bash_profile ~/.bash_profile
ln -s ./dotfiles/bashrc ~/.bashrc
echo "DONE"

# Copy VSCode settings
echo -n "Copying vscode settings..."
cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "DONE"
