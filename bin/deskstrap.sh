#!/usr/bin/env bash


# Install Command Line Tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Symlink Brewfile
ln -s ./brew/Brewfile ~/Brewfile

# Install applications with Brew
brew install
