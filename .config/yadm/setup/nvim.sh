sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update && sudo apt install -y neovim

git clone https://github.com/nickchahley/nvim ~/.config/nvim

# hardcoded backundoswap, could ideally read this from somewhere like
# vim.env.BACKUNDOSWAP
mkdir ~/.vim-backundoswap

sudo apt install -y build-essential # for make
sudo apt install -y golang # hexokinase dependency

# mason 
./node-18-via-nvm.sh

./nvim-dap-python.sh
