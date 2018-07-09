#!/usr/bin/env bash

# Imports
source ./functions.sh

# GLOBALS
GO_BACK=$(pwd)

# Symlink Brewfile to homedir
echo -n "Backing up and copying Brewfile to homedir..."
backup_and_copy Brewfile brew
echo "DONE"

# Symlink dotfiles
echo -n "Backing up and copying dotfiles..."
for FILE_NAME in bash_profile bashrc bash_aliases ; do
    if [ -f "/Users/$(whoami)/.${FILE_NAME}" ] ; then
        mv ~/.${FILE_NAME}{,.bak}
    fi
    cp ./dotfiles/${FILE_NAME} ~/.${FILE_NAME}
done
echo "DONE"

# Symlink Pipfile to homedir
echo -n "Backing up and copying Pipfiles to homedir..."
for FILE_NAME in Pipfile Pipfile.lock ; do
    if [ -f "/Users/$(whoami)/.${FILE_NAME}" ] ; then
        mv ~/.${FILE_NAME}{,.bak}
    fi
    cp ./python/${FILE_NAME} ~/.${FILE_NAME}
done
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

# Install pipenv
echo -n "Installing pipenv on system..."
sudo pip install pipenv
echo "DONE"

# Set up python environment
echo -n "Setting up python environment..."
cd ~ && pipenv install && cd ${GO_BACK}
echo "DONE"

# Copy VSCode settings
echo -n "Copying vscode settings..."
cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "DONE"
