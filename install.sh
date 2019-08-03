# Install dependencies for my default dev environment.

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Install Zsh
brew install zsh zsh-completions;

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
source ~/.zshrc;

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# GUI software
brew cask install kitty;
brew cask install spectacle;
brew cask install slack;
brew cask install firefox;
brew cask install bitwarden;
brew cask install spotify;
brew cask install docker;

# CLI tools
brew install neovim;
brew install python2;
brew install python3;
brew install go;
brew install rustup;
brew install tig;
brew install fzf;
brew install ripgrep;
brew install tree;
brew install schollz/tap/croc;

# Speed up key repeat, max is too slow
defaults write -g InitialKeyRepeat -int 10;
defaults write -g KeyRepeat -int 1;

# Install Xcode command line tools
xcode-select --install;
