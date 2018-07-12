#!/usr/bin/env bash

# Imports
source ./bin/functions.sh

# GLOBALS
GO_BACK=$(pwd)
HOSTNAME=icingdeath
# 32 is not very large.  100 is very large.
DOCKSIZE=32


# Backup and copy Brewfile to homedir
echo -n "Backing up and copying Brewfile to homedir..."
FILE_LIST=( Brewfile )
backup_and_copy ${FILE_LIST} brew ''
echo "DONE"

# Backup and copy profile
echo -n "Backing up and copying profile..."
FILE_LIST=( bash_profile bashrc bash_aliases )
backup_and_copy ${FILE_LIST} profile '.'
echo "DONE"

# Backup and copy vim
echo -n "Backing up and copying vim..."
FILE_LIST=( vimrc )
backup_and_copy ${FILE_LIST} vim '.'
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
if [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi
# This allows the installations of additional packages that are not part of
# core
brew tap homebrew/cask-versions
echo "DONE"

# Install applications with Brew
echo -n "Updating Brew and Installing applications from Brewfile..."
cd ~ && brew bundle && cd ${GO_BACK}
echo "DONE"

# Set up python environment
echo -n "Setting up python environment..."
LANG="en_US.UTF-8"; cd ~ && pipenv install && cd ${GO_BACK}
echo "DONE"

# Copy VSCode settings
echo -n "Copying vscode settings..."
mkdir -p ~/Library/Application\ Support/Code/User
cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
echo "DONE"

# Clone vundle
echo -n "Cloning Vundle for Vim..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "DONE"

# Install vim vundle plugins
echo -n "Installing vim vundle plugins..."
vim +PluginInstall +qall
echo "DONE"

# Set Hostname
echo -n "Set hostname..."
# Set hostname
sudo scutil --set HostName ${HOSTNAME}
# This is the user-friendly computer name you see in Finder, for example myMac.
sudo scutil --set ComputerName ${HOSTNAME}
dscacheutil -flushcache
echo "DONE"

# Set Docksize to 32
echo -n "Setting docksize to ${DOCKSIZE}..."
defaults write com.apple.dock tilesize -int ${DOCKSIZE}; killall Dock
echo "DONE"
