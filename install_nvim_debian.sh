#!/usr/bin/env bash

#Build and install neovim for Debian
#See: https://neovim.io/
#See: https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start

#See: https://gist.github.com/darcyparker/153124662b05c679c417

#Save current dir
pushd . > /dev/null || exit

#Install dependencies
sudo apt update
sudo apt install \
  autoconf \
  automake \
  cmake \
  g++ \
  gettext \
  libncurses5-dev \
  libtool \
  libtool-bin \
  libunibilium-dev \
  libunibilium4 \
  ninja-build \
  pkg-config \
  python3-pip \
  software-properties-common \
  unzip

# Enable use of python plugins
# Note: python neovim module was renamed to pynvim
# https://github.com/neovim/neovim/wiki/Following-HEAD#steps-to-update-pynvim-formerly-neovim-python-package
# pip uninstall pynvim neovim
# pip3 uninstall pynvim neovim
pip3 install setuptools
pip3 install --upgrade pynvim

#Get or update neovim github repo
mkdir -p ~/dev
cd ~/dev || exit
if [ ! -e ~/dev/neovim ]; then
  git clone https://github.com/neovim/neovim
else
  cd neovim || exit
  git pull origin
fi

cd ~/dev/neovim || exit
git checkout master

#Remove old build dir and .deps dir
rm -rf build/
rm -rf .deps/
make distclean

# Build and install neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local/"
sudo make install

#Restore dir
popd > /dev/null || exit

echo "nvim command: $(command -v nvim)"
echo "nvim command: $(ls -al "$(command -v nvim)")"
