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

# Symlink Brewfile
echo -n "Linking Brewfile to homedir..."
ln -s ./brew/Brewfile ~/Brewfile
echo "DONE"

# Install applications with Brew
echo -n "Installing applications from Brewfile..."
cd ./brew/ && brew bundle > /dev/null && cd ${GO_BACK}
echo "DONE"

