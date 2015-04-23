#!/usr/bin/env bash

if [ ! -e ./vimrc ]; then
  echo "Current directory does not contain dotfiles. Please run from project root."
  exit 1
fi

# Install oh-my-zsh!
# https://github.com/robbyrussell/oh-my-zsh
if [ -z ZSH ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  echo "Installed Oh-My-ZSH."
else
  echo "Oh-My-ZSH is already installed to ${ZSH}."
fi

# Create symbolic links for dotfiles.
rm ~/.gemrc
ln -s ${PWD}/gemrc ~/.gemrc
rm ~/.vimrc
ln -s ${PWD}/vimrc ~/.vimrc
rm ~/.zshrc
ln -s ${PWD}/zshrc ~/.zshrc

# Create the necessary vim folders.
if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
fi
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi
if [ ! -d ~/.vim/swapfiles ]; then
  mkdir -p ~/.vim/swapfiles
fi

# Download pathogen.
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Download bundles.
if [ ! -d ~/.vim/bundle/vim-javascript ]; then
  cd ~/.vim/bundle
  git clone git@github.com:pangloss/vim-javascript.git
else
  cd ~/.vim/bundle/vim-javascript
  git pull
fi
if [ ! -d ~/.vim/bundle/vim-markdown ]; then
  cd ~/.vim/bundle
  git clone git@github.com:tpope/vim-markdown.git
else
  cd ~/.vim/bundle/vim-markdown
  git pull 
fi
if [ ! -d ~/.vim/bundle/vim-sensible ]; then
  cd ~/.vim/bundle
  git clone git@github.com:tpope/vim-sensible.git
else
  cd ~/.vim/bundle/vim-sensible
  git pull
fi
if [ ! -d ~/.vim/bundle/command-t ]; then
  cd ~/.vim/bundle
  git clone git@github.com:wincent/command-t.git
  cd ./command-t/ruby/command-t
  ruby extconf.rb
  make
else
  cd ~/.vim/bundle/command-t
  git pull
  cd ~/.vim/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
fi

