#!/usr/bin/env bash

# GLOBALS
GO_BACK=$(pwd)

# Install Command Line Tools
echo -n "Installing XCode Command Line Tools..."
xcode-select --install
echo "DONE"

# Install Homebrew
echo -n "Installing Brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "DONE"

# Symlink Brewfile to homedir
echo -n "Linking Brewfile to homedir..."
for FILE_NAME in Brewfile ; do
    if [ -f "/Users/$(whoami)/.${FILE_NAME}" ] ; then
        mv ~/.${FILE_NAME}{,.bak}
    fi
    cp ./brew/${FILE_NAME} ~/.${FILE_NAME}
done
echo "DONE"

# Install applications with Brew
echo -n "Installing applications from Brewfile..."
cd ./brew/ && brew bundle && cd ${GO_BACK}
echo "DONE"

# Install pipenv
echo -n "Installing pipenv on system..."
sudo pip install pipenv
echo "DONE"

# Symlink Pipfile to homedir
echo -n "Installing pipenv on system..."
for FILE_NAME in Pipfile Pipfile.lock ; do
    if [ -f "/Users/$(whoami)/.${FILE_NAME}" ] ; then
        mv ~/.${FILE_NAME}{,.bak}
    fi
    cp ./python/${FILE_NAME} ~/.${FILE_NAME}
done
echo "DONE"

# Set up python environment
echo -n "Setting up python environment..."
cd ~ && pipenv install && cd ${GO_BACK}
echo "DONE"

# Symlink dotfiles
echo -n "Symlinking dotfiles..."
for FILE_NAME in bash_profile bashrc bash_aliases ; do
    if [ -f "/Users/$(whoami)/.${FILE_NAME}" ] ; then
        mv ~/.${FILE_NAME}{,.bak}
    fi
    cp ./dotfiles/${FILE_NAME} ~/.${FILE_NAME}
done
echo "DONE"

# Copy VSCode settings
echo -n "Copying vscode settings..."
cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "DONE"
