node_ver=${1:-"18"}
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.config/nvim" 
"$NVIM_DIR/nvm.sh"
nvm install $node_ver
nvm use $node_ver
