vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ${HOME}/.config/nvim/
	cp -p init.vim ${HOME}/.config/nvim/init.vim
	cp -p init.map.vim ${HOME}/.config/nvim/init.map.vim
	cp -p init.plug.vim ${HOME}/.config/nvim/init.plug.vim
	mkdir -p ${HOME}/.config/nvim/backups
	mkdir -p ${HOME}/.config/nvim/plugged
	mkdir -p ${HOME}/.config/nvim/swaps
	mkdir -p ${HOME}/.config/nvim/tmp
	mkdir -p ${HOME}/.config/nvim/undo
