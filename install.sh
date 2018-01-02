#!/bin/bash

# Author: https://github.com/logeshpaul
# Source: https://github.com/logeshpaul/dotfiles

## Custom color codes & utility functions
source helper/utility.sh

# Welcome msg
# ---------------
e_bold "${tan}Hola!!!"

# Mac Preferences
# ---------------
e_header "Mac Preference Update"
e_text "Please enter your password for performing some Mac Customizations"

source osx/screen.sh
source osx/dock.sh
source osx/terminal.sh
source osx/ui.sh
source osx/functions.sh

# Create Necessary Directories
# ----------------------------
e_header "Creating directory structure"

cd ~/ && mkdir Codelabs && mkdir Works
cd ~/dotfiles

# Git configuration
# -----------------
e_header "Setup git config (global)"

cp gitignore ~/.gitignore_global  ## Adding .gitignore global
git config --global core.excludesfile "${HOME}/.gitignore_global"

ask "${blue} (Option) Enter Your Github Email: "
read -r emailId
if is_empty $emailId; then
  git config --global user.email "$emailId" ## Git Email Id
  e_success "Email is set"
else
  e_error "Not set"
fi

ask "${blue} (Option) Enter Your Github Username: "
read -r userName
if is_empty $userName; then
  git config --global user.name "$userName" ## Git Username
  e_success "Username is set"
else
  e_error "Not set"
fi

# Install Oh-My-Zsh & custom aliases
# ----------------------------------
ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  e_warning "Oh My Zsh is already installed. Skipping.."
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh

  ## To install ZSH themes & aliases
  e_header "Copying ZSH themes & aliases..."
  e_note "Check .aliases file for more details."
  cp oh-my-zsh/aliases ~/.aliases                                        ## Copy aliases
  cp oh-my-zsh/zshrc ~/.zshrc                                            ## Copy zshrc configs
  cp oh-my-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme   ## Copy custom dracula theme
  cp -R oh-my-zsh/z ~/z                                                     ## z autocompletion
fi

# Install Homebrew
# ----------------
if test ! $(which brew); then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  e_warning "Homebrew is already installed. Skipping.."
fi

# Install NodeJS
# --------------
if test ! $(which nvm); then
  e_header "Installing nvm.."

  brew install nvm

  nvm install stable ## Installing stable version of node

  nvm use stable ## Setting stable as default node

  nvm use --delete-prefix stable

  ## To setup npm install/update -g without sudo
  # TODO: Some errors regarding this 
  cp npmrc ~/.npmrc
  mkdir "${HOME}/.npm-packages"
  export PATH="$HOME/.node/bin:$PATH"
  sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

  ## Set npm global config
  npm config set init.author.name "Gokulakrishnan Kalaikovan" ## Replace it with your name
  npm config set init.author.email "krishnangokul9@gmail.com" ## Replace it with your email id
else
  e_warning "NVM is already installed. Skipping.."
fi

## Yarn install
# -------------
if ! type yarn > /dev/null
then
  e_header "Install yarn.."
  brew install yarn
fi

## Remove cloned dotfiles from system
# TODO: Check if this is needed
# if [ -d ~/dotfiles ]; then
#  sudo rm -R ~/dotfiles
#fi

e_thanks "Author: https://github.com/logeshpaul \n"

echo "🍺  Thats all, Done. Note that some of these changes require a logout/restart to take effect."

# END
