#!/bin/bash

# ask for the administrator password upfront
sudo -v

# set hostname
sudo scutil --set HostName logeshpaul

# go into computer sleep mode after 20min
sudo systemsetup -setcomputersleep 20