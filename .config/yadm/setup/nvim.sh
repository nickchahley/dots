scriptdir=$(dirname "$0" )

sudo apt update && \
	sudo apt install -y software-properties-common && \
	sudo add-apt-repository -y ppa:neovim-ppa/unstable && \
	sudo apt update && sudo apt install -y neovim

git clone https://github.com/nickchahley/nvim ~/.config/nvim

# hardcoded backundoswap, could ideally read this from somewhere like
# vim.env.BACKUNDOSWAP
mkdir ~/.vim-backundoswap

sudo apt install -y build-essential # for make
sudo apt install -y golang # hexokinase dependency

# ensure rust deps installed
command -v rustup || curl https://sh.rustup.rs -sSf | sh
cargo install tree-sitter-cli

# mason 
"$scriptdir/node-18-via-nvm.sh"
"$scriptdir/nvim-dap-python.sh"
