################################################################################
# Setup some colors
################################################################################
blue=$(tput setaf 4)
bold=$(tput bold)
cyan=$(tput setaf 6)
green=$(tput setaf 2)
magenta=$(tput setaf 5)
red=$(tput setaf 1)
reset=$(tput sgr0)


################################################################################
# Include completion for git
################################################################################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source ~/.git-prompt.sh


################################################################################
# Begone, non-colored terminal!
################################################################################
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export TERM=xterm-color
export PS1='[\[$cyan\]\u\[$reset\]@\[$magenta\]\h\[$reset\] \W\[$green\]$(__git_ps1 " (%s)")\[$reset\]]\$ '
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
export ANT_HOME=/opt/apache-ant-1.9.0
export BIN_ROOT=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export HEROKU_BIN_ROOT=/usr/local/heroku/bin
export NPM_BIN_ROOT=/usr/local/share/npm/bin
export PG_ROOT=/usr/local/opt/postgresql/bin
export PGDATA=/usr/local/var/pgdata
export RBENV_ROOT=/usr/local/opt/rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl`"
export SOLR_ROOT=/usr/local/share/solr/libexec


################################################################################
# Add some love to the path
################################################################################
export PATH="$ANT_HOME/bin:$PG_ROOT:$HEROKU_BIN_ROOT:$NPM_BIN_ROOT:$BIN_ROOT"


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
alias md='mkdir'
alias r=rails
alias reload_profile='. $HOME/.bash_profile'
alias t3='cd $HOME/projects/t3'
alias vi='mvim -v'
alias vim='mvim -v'
alias ~='cd ~'

