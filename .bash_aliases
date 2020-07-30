##############################################################################
# Mantiene:
#           Cristian Andrione
#           cristian.andrione@gmail.com
#
# Archivo: ~/.bash_aliases para .bashrc
#
##############################################################################

alias e='exit'
alias t='tmux'

alias l='ls -lah'
alias ll='ls -lh'

alias ..='cd ..'
alias ...='cd ../..'

alias grep='grep --color=auto'

function h { history; }
function l. { ( if test -d "$1";  then cd $1;  fi  &&  ls -ldF .[^\.]*; ); }

HISTTIMEFORMAT="%d/%m/%y %T "

# Caminos importantes
alias cdb='cd $HOME/.local/bin/'
alias cdf='cd $HOME/Fuentes/'
alias cda='cd $HOME/Fuentes/proy_sat_web/ng-sat'
alias cdr='cd $HOME/Fuentes/proy_sat_web/rocket-sat'

# Prompt
export PS1="\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[1;33m\]\$(__git_ps1 '->(%s)')\[\033[00m\]\$ "
unset color_prompt force_color_prompt

# IP
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# PATH
#export PATH=$HOME/.local/bin:$PATH

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
