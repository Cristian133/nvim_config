.PHONY: vim dot

dot:
	cp -p .tmux.conf ${HOME}
	cp -p .nanorc ${HOME}
	cp -p .screenrc ${HOME}
	cp -p .bash_aliases ${HOME}
	mkdir -p ${HOME}/.local/bin
	cp -p ./bin/chpermfile ${HOME}/.local/bin/
	cp -p ./bin/chpermdir ${HOME}/.local/bin/

vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Nerd_Font.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
	mkdir -p ${HOME}/.config/nvim/
	cp -p init.vim ${HOME}/.config/nvim/init.vim
	cp -p init.map.vim ${HOME}/.config/nvim/init.map.vim
	cp -p init.plug.vim ${HOME}/.config/nvim/init.plug.vim
	mkdir -p ${HOME}/.config/nvim/backups
	mkdir -p ${HOME}/.config/nvim/colors
	curl -LSso ${HOME}/.config/nvim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
	mkdir -p ${HOME}/.config/nvim/help
	cp -p help.txt ${HOME}/.config/nvim/help/
	mkdir -p ${HOME}/.config/nvim/plugged
	mkdir -p ${HOME}/.config/nvim/swaps
	mkdir -p ${HOME}/.config/nvim/tmp
	mkdir -p ${HOME}/.config/nvim/undo

rust:
	curl -sf -L https://static.rust-lang.org/rustup.sh | sh
	rustc --version
	cargo --version
	rustup toolchain add nightly
	cargo +nightly install racer
	cd ${HOME}/.cargo
	git clone https://github.com/rust-lang/rust.git

all: .PHONY
