.PHONY: vim rust dot

dot:
	cp -p .tmux.conf ${HOME}
	cp -p .bash_aliases ${HOME}
	mkdir -p ${HOME}/.local/bin

vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ${HOME}/.config/nvim/
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

rust:
	curl -sf -L https://static.rust-lang.org/rustup.sh | sh
	rustc --version
	cargo --version
	rustup toolchain add nightly
	cargo +nightly install racer
	cd ${HOME}/.cargo
	git clone https://github.com/rust-lang/rust.git

all: .PHONY
