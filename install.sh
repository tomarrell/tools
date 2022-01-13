# Install dependencies for my default dev environment.

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Install Zsh
brew install zsh zsh-completions;

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
source ~/.zshrc;

# Fonts
brew tap homebrew/cask-fonts;
brew install --cask font-fira-code;
brew install --cask font-ibm-plex;

# GUI software
brew install --cask kitty;
brew install --cask spectacle;
brew install --cask slack;
brew install --cask firefox;
brew install --cask spotify;
brew install --cask docker;
brew install --cask tunnelblick;
brew install --cask postico;

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
brew install the_silver_searcher;
brew install nvm;
brew install awscli;
brew install bat;
brew install tmux;

# Speed up key repeat, max is too slow
defaults write -g InitialKeyRepeat -int 10;
defaults write -g KeyRepeat -int 1;

# Neovim setup python hooks
pip3 install --user --upgrade pynvim;
pip2 install --user --upgrade pynvim;

# Install Xcode command line tools
xcode-select --install;
