#!/usr/bin/env bash

# Build, install and config neovim for Debian/Ubuntu.
# See: https://neovim.io/
# See: https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start
# See: https://gist.github.com/darcyparker/153124662b05c679c417

# Save current dir
pushd . > /dev/null || exit

# Install dependencies
sudo apt-get update
sudo apt-get install build-essential zsh mc exuberant-ctags tmux git curl\
    tree htop gforth rlwrap autoconf automake cmake g++ gettext libtool\
    libncurses5-dev libtool-bin libunibilium-dev libunibilium4 ninja-build\
    pkg-config python3-pip python3-dev python3-venv software-properties-common\
    unzip\

npm install -g neovim

# Get or update neovim github repo
mkdir --parents ~/dev
cd ~/dev || exit
if [ ! -e ~/dev/neovim ]; then
  git clone https://github.com/neovim/neovim
else
  cd neovim || exit
  git pull origin
fi

cd ~/dev/neovim || exit
git checkout master

# Remove old build dir and .deps dir
rm -rf build/
rm -rf .deps/
make distclean

# Build and install neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local/"
make install

# Restore dir
popd > /dev/null || exit

echo "nvim command: $(command -v nvim)"
echo "nvim command: $(ls -al "$(command -v nvim)")"

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustc --version
cargo --version

# formatter
rustup component add rust-analyzer

# linter
rustup component add clippy

# Nerd Fonts Icons
# for Debian uncomment next line
#mkdir ${HOME}/.fonts && cd $_
# for Ubuntu uncomment next line
mkdir ${HOME}/.local/share/fonts && cd $_

# Fonts
#https://www.nerdfonts.com/font-downloads
# Recomended fonts
#1) https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/ComicShannsMono.zip
#2) https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip

# nvim config files for rust development
cd ~/.config || exit

# Before this install ssh-keys for github
# https://docs.github.com/es/authentication/connecting-to-github-with-ssh
git clone git@github.com:Cristian133/nvim_config.git nvim
# or without ssh-keys
git clone https://github.com/Cristian133/nvim.lua.git nvim

