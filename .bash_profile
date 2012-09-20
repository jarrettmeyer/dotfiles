# Setup some colors
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)

# Include completion for git
source /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.git-prompt.sh

# Begone, non-colored terminal!
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export TERM=xterm-color
export PS1='[\u@\h \W\[$green\]$(__git_ps1 " (%s)")\[$reset\]]\$ '
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

# Append to the history file
shopt -s histappend

# Add some love to the path
export PATH="$HOME/.rbenv/bin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Enable rbenv shims
# For more about rbenv: https://github.com/sstephenson/rbenv
eval "$(rbenv init -)"

# Friendly aliases
alias blog='cd ~/projects/blog'
alias dir='ls -lahs'
alias e='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias edit='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias g='git'
alias ll='ls -lah'
alias ls='ls -G'
alias reload_profile='. $HOME/.bash_profile'
alias t3='cd $HOME/projects/t3'
alias vi='mvim -v'
alias vim='mvim -v'
alias ~='cd ~'



