.PHONY: install gsoap lua font vim dot

install:
	sudo apt update
	sudo apt install build-essential mc tree tmux htop exuberant-ctags curl git rlwrap

# for Felix compile
gsoap:
	sudo apt install gsoap libgsoap-dev libssl-dev

texlive:
	sudo apt install texlive texlive-lang-spanish

markdown:
	sudo apt install pandoc texlive-latex-extra

python:
	sudo apt install python3-pip python3-dev python3-venv

# Dependencias python3 neovim
python_neovim:
	sudo pip3 install pynvim flake8 pylint

haskell:
	sudo apt install haskell-platform

forth:
	sudo apt install gforth

zsh:
	sudo apt install zsh
	sudo chsh -s $(which zsh)
	sudo apt install fonts-cascadia-code
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

dot:
	cp -p .tmux.conf ${HOME}
	cp -p .nanorc ${HOME}
	cp -p .gitconfig ${HOME}
	mkdir -p ${HOME}/.nano
	cp -p .bash_aliases ${HOME}
	mkdir -p ${HOME}/.local/bin
	cp -p ./bin/chpermfile ${HOME}/.local/bin/
	cp -p ./bin/chpermdir ${HOME}/.local/bin/
	cp -pr  nvim ${HOME}/.config/

# Modify originals and copy here.
back:
	cp -p ${HOME}/.tmux.conf .
	cp -p ${HOME}/.nanorc .
	cp -p ${HOME}/.zshrc .
	cp -p ${HOME}/.gitconfig .
	cp -pR ${HOME}/.config/nvim .
	cp -pR ${HOME}/.config/nvim .
	cp -pR ${HOME}/.config/nvim .

font:
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Deprecated alternative paths: ~/.fonts
# For nvim plugin https://github.com/ryanoasis/vim-devicons on Debian 11
# https://github.com/ryanoasis/nerd-fonts/wiki/Glyph-Sets-and-Code-Points
font_debian:
	mkdir -p ~/.fonts
	cd ~/.fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

nvim:
	./install_nvim_debian.sh

lua:
	sudo apt install lua5.4

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustc --version
	cargo --version
	rustup toolchain add nightly
	cargo +nightly install racer
	cd ${HOME}/.cargo
	git clone https://github.com/rust-lang/rust.git

all: .PHONY
