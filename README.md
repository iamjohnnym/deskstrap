# Deskstrap

*Deskstrap* is my desktop bootstrapper for OSX.  I tend to want to start fresh more often than I care to admit.  This usually means that I'll spend a few hours getting things peachy.  Additionally, my personal vs my work machine are vastly different from the core usability part.  This aims to reduce the differences and time needed when moving into a new machine.

## Prerequisites

Ability to use the terminal and `sudo`

## Installation

Simply clone the repo, move into it, execute the `deskstrap.sh` command.

```bash
git clone https://github.com/iamjohnnym/deskstrap.git ~/deskstrap
cd ~/deskstrap
sudo bash ./bin/deskstrap.sh
```

## Features

- Brew
- Pipenv
- Profile dotfiles
- VSCode
- Vundle

## Brew

Brew comes with `brew bundle`, which acts like a python's `requirements.txt`.  I've outlined various programs that I want installed on each of my machines.  These are found in the Brewfile:

### Social Applications
- slack
- alfred
- dropbox
- gimp

### Development Tools
- docker
- direnv
- lastpass-cli
- pipenv
- postman
- rbenv
- spotify
- vagrant
- vagrant-manager
- vim
- virtualbox
- virtualbox-extension-pack
- visual-studio-code

### Commandline Necessities
- tree
- wget
- iterm2

### Browsers
- chromedriver
- firefox-developer-edition
- google-chrome

### VPN
- viscosity

## Pipenv

Pipenv is a really cool python manager.  Instead of multiple `requirements.txt` files, we can now use just one.  Another nifty benefit is that `pipenv` creates a virtualenv.

### Installs
- boto3
- awscli

#### Dev Packages
- nose
- flake8
- pytest-cov
- bandit
- codacy-coverage
- pytest-selenium
- Flask-Testing
- PyYAML

## VSCode
A usersettings file is maintained and copied over on `deskstrap`.

## Vundle
Vundle is a plugin manager for `vim`.  Its nifty and a recommended must have for `vim` lovers.  The included `vimrc` file is mixing the best of `vundle` with the best of `vim`
