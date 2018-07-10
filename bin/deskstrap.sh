#!/usr/bin/env bash

# Imports
source ./bin/functions.sh

# GLOBALS
GO_BACK=$(pwd)

# Backup and copy Brewfile to homedir
echo -n "Backing up and copying Brewfile to homedir..."
FILE_LIST=( Brewfile )
backup_and_copy ${FILE_LIST} brew ''
echo "DONE"

# Backup and copy dotfiles
echo -n "Backing up and copying dotfiles..."
FILE_LIST=( bash_profile bashrc bash_aliases )
backup_and_copy ${FILE_LIST} dotfiles '.'
echo "DONE"

# Backup and copy Pipfile to homedir
echo -n "Backing up and copying Pipfiles to homedir..."
FILE_LIST=( Pipfile Pipfile.lock )
backup_and_copy ${FILE_LIST} python ''
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
echo -n "Updating Brew and Installing applications from Brewfile..."
brew update
cd ~ && brew bundle && cd ${GO_BACK}
echo "DONE"

# Set up python environment
echo -n "Setting up python environment..."
LANG="en_US.UTF-8" cd ~ && pipenv install && cd ${GO_BACK}
echo "DONE"

# Copy VSCode settings
echo -n "Copying vscode settings..."
mkdir -p ~/Library/Application\ Support/Code/User
cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "DONE"
