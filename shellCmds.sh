# no delay before showing the dock on autohide
defaults write com.apple.Dock autohide-delay -float 0
# no animation either
defaults write com.apple.dock autohide-time-modifier -int 0
# restart the dock
killall Dock
