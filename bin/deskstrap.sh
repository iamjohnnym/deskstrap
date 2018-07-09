#!/usr/bin/env bash


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

# Moving to homedir
echo -n "Moving to homedir..."
cd ~
echo "DONE"

# Install applications with Brew
echo -n "Installing applications from Brewfile..."
brew bundle > /dev/null
echo "DONE"
