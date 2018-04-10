#!/bin/bash

## Custom color codes & utility functions
  source ./helper/utility.sh

# Dock
  e_text 'Setting defaults for Misson Control …'

# Don’t automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

# Speed up Mission Control animations
  defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable Dashboard
  defaults write com.apple.dashboard mcx-disabled -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Put display to sleep
  defaults write com.apple.dock wvous-tl-corner -int 10
  defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Desktop
  defaults write com.apple.dock wvous-tr-corner -int 4
  defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Mission Control
  defaults write com.apple.dock wvous-bl-corner -int 2
  defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Show application windows
  defaults write com.apple.dock wvous-br-corner -int 3
  defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock