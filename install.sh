# Install dependencies for my default dev environment.

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# GUI software
brew cask install kitty;
brew cask install spectacle;
brew cask install slack;
brew cask install firefox;
brew cask install bitwarden;

# CLI tools
brew install neovim;
brew install python2;
brew install python3;
brew install go;
brew install tig;

# Speed up key repeat, max is too slow
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
