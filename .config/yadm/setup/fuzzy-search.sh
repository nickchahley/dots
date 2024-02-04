#!/bin/bash

# ubuntu 18.04, fzf and ripgrep have no official repo
REPOS="$HOME/.local/repos"
[ -d "$REPOS" ] || mkdir -p "$REPOS"
echo "install to $REPOS"

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git "$REPOS/fzf"
"$REPOS/fzf/install"

# rg
sudo apt update && sudo apt install cargo
git clone https://github.com/BurntSushi/ripgrep "$REPOS/ripgrep"
cd "$REPOS/ripgrep"
git checkout 8a7db1a
cargo build --release
./target/release/rg --version
ln -s "$(realpath ./target/release/rg)" "$HOME/.local/bin"
