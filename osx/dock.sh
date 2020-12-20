#!/bin/bash

## Custom color codes & utility functions
  source ./helper/utility.sh

# Dock
  e_text 'Setting defaults for Dock …'

# Set Dark Theme to Dock & Fullscreen
  defaults write NSGlobalDomain AppleInterfaceStyle Dark;

# Remove the auto-hiding Dock delay
  defaults write com.apple.Dock autohide-delay -float 0

# Disable hide and show the Dock
  defaults write com.apple.dock autohide -bool false

# Set the icon size of Dock items to 34 pixels
  defaults write com.apple.dock tilesize -int 34

# Don’t animate opening applications from the Dock
  defaults write com.apple.dock launchanim -bool false

# Show indicator lights for open applications in the Dock
  defaults write com.apple.dock show-process-indicators -bool true

# Removed genie animation
  defaults write com.apple.dock mineffect suck; killall Dock

# Removes bouncing animation
  defaults write com.apple.dock no-bouncing -bool true

# Change minimize/maximize window effect
  defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
  defaults write com.apple.dock minimize-to-application -bool true

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
# defaults write com.apple.dock static-only -bool true

# TODO: Set dock icons
# Ref: https://github.com/reitermarkus/dotfiles/blob/master/include/settings/dock.sh#L74

killall Dock
