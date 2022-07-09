# super user
alias _='sudo'

# exit
alias e='exit'
alias E='exit'
alias :q='exit'

alias t='tmux'
alias n='nano'

alias l='ls -lah'
alias ll='ls -lh'

alias ..='cd ..'
alias ...='cd ../..'

alias grep='grep --color=auto'

function h { history; }
function l. { ( if test -d "$1";  then cd $1;  fi  &&  ls -ldF .[^\.]*; ); }

HISTTIMEFORMAT="%d/%m/%y %T "

# important paths
alias cdb='cd $HOME/.local/bin/'
alias cdv='cd $HOME/.dev/'

# node version in prompt
_node_version()
{
  local br
  br=$(node -v)
  test -n "$br" && printf %s "$br" || :
}

green=$'\e[1;32m'
magenta=$'\e[1;35m'
normal_colours=$'\e[m'

# Prompt
export PS1="\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[1;33m\]\$(__git_ps1 ' -> (%s)')\[\033[00m\]\$ "
# export PS1="${PS1:0:$((${#PS1} - 2))} node \[$magenta\]\$(_node_version)\[$normal_colours\] \$ "
unset color_prompt force_color_prompt

# IP
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# alias git
alias gs='git status'
alias gl='git log --oneline --decorate --graph --all'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
