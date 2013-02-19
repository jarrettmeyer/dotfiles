################################################################################
# Setup some colors
################################################################################
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)


################################################################################
# Include completion for git
################################################################################
source /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.git-prompt.sh


################################################################################
# Begone, non-colored terminal!
################################################################################
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export TERM=xterm-color
export PS1='[\u@\h \W\[$green\]$(__git_ps1 " (%s)")\[$reset\]]\$ '
export GREP_OPTIONS="--color"


################################################################################
# Erase duplicates in history
################################################################################
export HISTCONTROL=erasedups


################################################################################
# Store 10k history entries
################################################################################
export HISTSIZE=10000


################################################################################
# Append to the history file
################################################################################
shopt -s histappend


################################################################################
# Set up some handy variable exports 
################################################################################
export BIN_ROOT=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export HEROKU_BIN_ROOT=/usr/local/heroku/bin
export NPM_BIN_ROOT=/usr/local/share/npm/bin
export POSTGRES_ROOT=/
export RBENV_ROOT=/usr/local/opt/rbenv
export SOLR_ROOT=/usr/local/share/solr


################################################################################
# Add some love to the path
################################################################################
export PATH="$POSTGRES_ROOT:$HEROKU_BIN_ROOT:$NPM_BIN_ROOT:$BIN_ROOT"


################################################################################
# Enable rbenv shims
# For more about rbenv: https://github.com/sstephenson/rbenv
################################################################################
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


################################################################################
# Friendly aliases
################################################################################
alias blog='cd ~/projects/blog'
alias dir='ls -lahs'
alias e='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias g='git'
alias ll='ls -lah'
alias ls='ls -G'
alias r=rails
alias reload_profile='. $HOME/.bash_profile'
alias t3='cd $HOME/projects/t3'
alias vi='mvim -v'
alias vim='mvim -v'
alias ~='cd ~'

