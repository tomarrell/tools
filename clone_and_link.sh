# Create config dir
mkdir -p ~/.config/tomarrell;

# Clone tools repo and link things into place
git clone https://github.com/tomarrell/tools.git ~/.config/tomarrell/tools;

# Neovim
ln -s ~/.config/tomarrell/tools/nvim ~/.config

# Tmux
ln -s ~/.config/tomarrell/tools/tmux/.tmux.conf ~/.tmux.conf;

# Zsh
ln -s ~/.config/tomarrell/tools/zsh/.zshrc ~/.zshrc;
