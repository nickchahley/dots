sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install -y neovim

git clone https://github.com/nickchahley/nivm ~/.config/nvim

# hardcoded backundoswap, could ideally read this from somewhere like
# vim.env.BACKUNDOSWAP
mkdir ~/.vim-backundoswap

# hexokinase dependency
sudo apt install -y golang

# mason 
./node-18-via-nvm.sh*

./nvim-dap-python.sh
