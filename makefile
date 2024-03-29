.PHONY: install vim dot desktop

install:
	sudo apt update
	sudo apt install build-essential mc tree tmux htop curl git libssl-dev

# for Felix compile
gsoap:
	sudo apt install gsoap libgsoap-dev
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
	sudo apt install gforth rlwrap

zsh:
	sudo apt install zsh
	sudo chsh -s $(which zsh)
	sudo apt install fonts-cascadia-code
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

dot:
	cp -p .tmux.conf ${HOME}
	cp -p .nanorc ${HOME}
	mkdir -p ${HOME}/.nano
	cp -p .bash_aliases ${HOME}
	mkdir -p ${HOME}/.local/bin
	cp -p ./bin/chpermfile ${HOME}/.local/bin/
	cp -p ./bin/chpermdir ${HOME}/.local/bin/

#Modify only the originals and then copy here.
back:
	cp -p ${HOME}/.tmux.conf .
	cp -p ${HOME}/.nanorc .
	cp -p ${HOME}/.bash_aliases .
	cp -p ${HOME}/.zshrc .
	cp -p ${HOME}/.gitconfig .
	cp -pR ${HOME}/.config/nvim/init.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.map.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.plug.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.coc.vim ./nvim

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
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ${HOME}/.config/nvim/
	cp -p ./nvim/init.vim ${HOME}/.config/nvim/init.vim
	cp -p ./nvim/init.tab.vim ${HOME}/.config/nvim/init.tab.vim
	cp -p ./nvim/init.map.vim ${HOME}/.config/nvim/init.map.vim
	cp -p ./nvim/init.map.vscode.vim ${HOME}/.config/nvim/init.map.vscode.vim
	cp -p ./nvim/init.plug.vim ${HOME}/.config/nvim/init.plug.vim
	cp -p ./nvim/init.coc.vim ${HOME}/.config/nvim/init.coc.vim
	mkdir -p ${HOME}/.config/nvim/backups
	mkdir -p ${HOME}/.config/nvim/colors
	curl -LSso ${HOME}/.config/nvim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
	mkdir -p ${HOME}/.config/nvim/plugged
	mkdir -p ${HOME}/.config/nvim/swaps
	mkdir -p ${HOME}/.config/nvim/tmp
	mkdir -p ${HOME}/.config/nvim/undo

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
