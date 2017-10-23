export EDITOR=emacs
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \$ \[\033[00m\]'
export PROMPT_COMMAND=$'echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'
alias grep='grep --color=auto'
GREP_COLOR=32
alias egrep='egrep --color=auto'

# Colorize man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
export PATH="$PATH:/Applications/google-cloud-sdk/bin"
export PATH="$PATH:/Users/Tony/Library/Android/sdk/tools"
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
