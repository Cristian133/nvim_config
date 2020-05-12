.PHONY: vim

vim:
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -p init.vim ${HOME}/.config/nvim/init.vim
	mkdir -p ${HOME}/.config/nvim/backups
	mkdir -p ${HOME}/.config/nvim/colors
	curl -LSso ${HOME}/.config/nvim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
	mkdir -p ${HOME}/.config/nvim/help
	cp -p help ${HOME}/.config/nvim/help/
	mkdir -p ${HOME}/.config/nvim/plugged
	mkdir -p ${HOME}/.config/nvim/swaps
	mkdir -p ${HOME}/.config/nvim/tmp
	mkdir -p ${HOME}/.config/nvim/undo

all: .PHONY
