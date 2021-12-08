# Repositorio: nvim_config

## Uso:
Probado en Ubuntu 20.4:

    cd nvim_config
    make <install>


## Instalaciones
    install:
        sudo apt update
        sudo apt install build-essential neovim mc tree tmux screen htop exuberant-ctags curl git rlwrap

### Para compilar Felix.
    gsoap:
	    sudo apt install gsoap libgsoap-dev libssl-dev

### Para configurar dock de Ubuntu.
    desktop:
	    sudo apt install gnome-tweaks
	    gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 1.0

### LaTeX.
    texlive:
	    sudo apt install texlive texlive-lang-spanish

### Markdown.
    markdown:
	    sudo apt pandoc texlive-latex-extra

### Python.
    python:
	    sudo apt install python3-pip python3-dev python3-venv

### Dependencias python3 neovim.
    python_neovim:
	    sudo pip3 install pynvim flake8 pylint

### Haskell.
    haskell:
	    sudo apt install haskell-platform

### gForth.
    forth:
	sudo apt install gforth

### Nodejs
    node:
	    curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
	    sudo apt install nodejs
	    npm install -g npm@latest

### Angular
    angular:
	    sudo npm install -g @angular/cli@latest

### VSCode.
    vscode:
	    sudo snap install --classic code

## Zoom
    zoom:
	    sudo snap install zoom-client

### Postman

    postman:
	    sudo snap install postman

### MongoDB Compass

    compass:
	    wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.1_amd64.deb
	    sudo dpkg -i mongodb-compass_1.26.1_amd64.deb

### Archivos de configuración
    dot:
	    cp -p .tmux.conf ${HOME}
	    cp -p .nanorc ${HOME}
        mkdir -p ${HOME}/.nano
        cp -p .bash_aliases ${HOME}
        mkdir -p ${HOME}/.local/bin
        cp -p ./bin/chpermfile ${HOME}/.local/bin/
        cp -p ./bin/chpermdir ${HOME}/.local/bin/

### Fish
    fish:
	    sudo apt install fish
	    cp -p .config.fish ${HOME}/.config/fish/

### Neovim

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
        mkdir -p ${HOME}/.config/nvim/plugged
        mkdir -p ${HOME}/.config/nvim/swaps
        mkdir -p ${HOME}/.config/nvim/tmp
        mkdir -p ${HOME}/.config/nvim/undo

##  Rust

    rust:
        curl -sf -L https://static.rust-lang.org/rustup.sh | sh
        rustc --version
        cargo --version
        rustup toolchain add nightly
        cargo +nightly install racer
        cd ${HOME}/.cargo
        git clone https://github.com/rust-lang/rust.git

