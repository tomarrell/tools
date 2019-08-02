# Clone tools repo and move things into place

git clone https://github.com/tomarrell/tools.git tom_tools;

mkdir -p ~/.config;
mv ./tools/nvim ~/.config/nvim;
mv ./tools/tmux/.tmux.conf ~/.tmux.conf;
