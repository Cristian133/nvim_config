.PHONY: install vim dot desktop

install:
	sudo apt update
	sudo apt install build-essential neovim mc tree tmux screen htop exuberant-ctags curl git rlwrap

# Para compilar Felix
gsoap:
	sudo apt install gsoap libgsoap-dev libssl-dev

desktop:
	gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 1.0

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

node:
	curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
	sudo apt install nodejs
	sudo npm install -g npm@latest

angular:
	sudo npm install -g @angular/cli@latest

vscode:
	sudo snap install --classic code

vlc:
	sudo apt install vlc ubuntu-restricted-extras

zoom:
	sudo snap install zoom-client

postman:
	sudo snap install postman

slack:
	sudo snap install slack --classic

compass:
	wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.1_amd64.deb
	sudo dpkg -i mongodb-compass_1.26.1_amd64.deb

zsh:
	sudo apt install zsh
	sudo chsh -s $(which zsh)
	sudo apt install fonts-cascadia-code
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

dot:
	cp -p .tmux.conf ${HOME}
	cp -p .nanorc ${HOME}
	mkdir -p ${HOME}/.nano
	cp -p .bash_aliases ${HOME}
	mkdir -p ${HOME}/.local/bin
	cp -p ./bin/chpermfile ${HOME}/.local/bin/
	cp -p ./bin/chpermdir ${HOME}/.local/bin/

back:
	cp -p ${HOME}/.tmux.conf .
	cp -p ${HOME}/.nanorc .
	cp -p ${HOME}/.bash_aliases .
	cp -p ${HOME}/.zshrc .
	cp -p ${HOME}/.zsh-spaceship-theme-config .
	cp -p ${HOME}/.zsh_aliases .
	cp -p ${HOME}/.gitconfig .
	cp -pR ${HOME}/.config/nvim/init.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.tab.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.map.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.map.vscode.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.plug.vim ./nvim
	cp -pR ${HOME}/.config/nvim/init.coc.vim ./nvim

vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Nerd_Font.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
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

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rust:
	curl -sf -L https://static.rust-lang.org/rustup.sh | sh
	rustc --version
	cargo --version
	rustup toolchain add nightly
	cargo +nightly install racer
	cd ${HOME}/.cargo
	git clone https://github.com/rust-lang/rust.git

all: .PHONY
