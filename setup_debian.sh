#!/usr/bin/env bash

# Build and install neovim for Debian
# See: https://neovim.io/
# See: https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start

# See: https://gist.github.com/darcyparker/153124662b05c679c417

# Save current dir
pushd . > /dev/null || exit

# Install dependencies
sudo apt update
sudo apt install build-essential mc tree tmux curl git\
    autoconf automake cmake make \
    g++ gfortran gforth lua5.4\
    gettext texlive texlive-lang-spanish\
    libncurses-dev libtool libtool-bin libunibilium-dev libunibilium4 libssl-dev\
    libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev \
    ninja-build \
    software-properties-common pkg-config \
    python3-pip python3-dev python3-venv\
    unzip

# Enable use of python plugins
# Note: python neovim module was renamed to pynvim
# https://github.com/neovim/neovim/wiki/Following-HEAD#steps-to-update-pynvim-formerly-neovim-python-package
# pip uninstall pynvim neovim
# pip3 uninstall pynvim neovim
pip3 install setuptools
pip3 install --upgrade pynvim

# Get or update neovim github repo
mkdir -p ~/.dev
cd ~/.dev || exit
if [ ! -e ~/.dev/neovim ]; then
  git clone https://github.com/neovim/neovim
else
  cd neovim || exit
  git pull origin
fi

cd ~/.dev/neovim || exit
git checkout master

#Remove old build dir and .deps dir
rm -rf build/
rm -rf .deps/
make distclean

# Build and install neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local/"
sudo make install

echo "nvim command: $(command -v nvim)"
echo "nvim command: $(ls -al "$(command -v nvim)")"

#Build and install git for Debian
echo "let started with git"
mkdir -p ~/.dev/git-build;
wget https://github.com/git/git/archive/refs/heads/maint.zip -O ~/.dev/git-build/git.zip;
cd ~/.dev/git-build;
unzip -q git.zip;
cd git-*;

currentGitVersion=$(git --version | sed -e 's/git version //');
downloadGitVersion=$(cat GIT-VERSION-GEN | grep "$currentGitVersion");

if [ -z "$downloadGitVersion" ]; then
    make prefix=/usr/local all;
    sudo make prefix=/usr/local install;
fi


distCodeName=$(lsb_release -cs);

# Config files
cd ~/.dev/nvim_config/
cp -p .tmux.conf ${HOME}
cp -p .nanorc ${HOME}
mkdir -p ${HOME}/.nano
cp -p .alias ${HOME}
mkdir -p ${HOME}/.local/bin
cd bin/
cp -p chpermfile chpermdir colors.sh ${HOME}/.local/bin/
cd ~/

#Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Tmux plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Restore dir
popd > /dev/null || exit
