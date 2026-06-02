# this script has issues being run but these steps executed manually should
# still give correct results
# assumes that shell config files already have correct lines in them to load nvm
node_ver=${1:-"18"}
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.config/nvm" 
chmod +x "$NVM_DIR/nvm.sh"
bash "$NVM_DIR/nvm.sh"
nvm install $node_ver
nvm use $node_ver
