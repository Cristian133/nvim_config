if status is-interactive

    # Commands to run in interactive sessions can go here
    set -g -x fish_greeting ''
    set -g theme_powerline_fonts no
    set -g theme_nerd_fonts yes

    # alias
    alias e "exit"
    alias E "exit"
    alias :q "exit"
    alias t "tmux"
    alias _ "sudo"
    alias mosml='rlwrap mosml -P full'

    # paths
    alias cdv "cd /home/cristian/dev"

    # git
    alias gs "git status"

    # exa
    alias la='exa -abghHliS'
    alias le='exa -bghHliS'
    alias lt='exa --long --tree'
    alias lta='exa -abghHltS'

end
