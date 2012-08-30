# Include completion for git
source /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.git-prompt.sh

# Begone, non-colored terminal!
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export TERM=xterm-color
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

# Append to the history file
shopt -s histappend

# Add some love to the path
export PATH="$HOME/.rbenv/bin:$PATH"

# Enable rbenv shims
# For more about rbenv: https://github.com/sstephenson/rbenv
eval "$(rbenv init -)"

# Friendly aliases
alias blog='cd ~/projects/heroku/blog'
alias dir='ls -lahs'
alias e='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias g='git'
alias ll='ls -lah'
alias ls='ls -G'
alias ~='cd ~'



