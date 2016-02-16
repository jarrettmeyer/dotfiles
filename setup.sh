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
echo "Creating symbolic links."
ln -s -f ${PWD}/editorconfig ~/.editorconfig
ln -s -f ${PWD}/gemrc ~/.gemrc
ln -s -f ${PWD}/gitconfig ~/.gitconfig
ln -s -f ${PWD}/vimrc ~/.vimrc
ln -s -f ${PWD}/zshrc ~/.zshrc

# Create the necessary vim folders.
if [ ! -d ~/.vim/autoload ]; then
  echo "Creating directory: ~/.vim/autoload"
  mkdir -p ~/.vim/autoload
fi
if [ ! -d ~/.vim/bundle ]; then
  echo "Creating directory: ~/.vim/bundle"
  mkdir -p ~/.vim/bundle
fi
if [ ! -d ~/.vim/swapfiles ]; then
  echo "Creating directory: ~/.vim/swapfiles"
  mkdir -p ~/.vim/swapfiles
fi

# Download pathogen.
echo "Downloading vim pathogen."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Download bundles.
if [ ! -d ~/.vim/bundle/vim-colorschemes ]; then
  echo "Installing vim colorschemes."
  cd ~/.vim/bundle
  git clone https://github.com/flazz/vim-colorschemes.git
else
  echo "Updating vim colorschemes."
  cd ~/.vim/bundle/vim-colorschemes
  git pull
fi
if [ ! -d ~/.vim/bundle/vim-fugitive ]; then
  echo "Installing vim fugitive."
  cd ~/.vim/bundle
  git clone https://github.com/tpope/vim-fugitive.git
else
  echo "Updating vim fugitive."
  cd ~/.vim/bundle/vim-fugitive
  git pull
fi
if [ ! -d ~/.vim/bundle/vim-javascript ]; then
  echo "Installing vim javascript."
  cd ~/.vim/bundle
  git clone https://github.com/pangloss/vim-javascript.git
else
  echo "Updating vim javascript."
  cd ~/.vim/bundle/vim-javascript
  git pull
fi
if [ ! -d ~/.vim/bundle/vim-markdown ]; then
  echo "Installing vim markdown."
  cd ~/.vim/bundle
  git clone https://github.com/tpope/vim-markdown.git
else
  echo "Updating vim markdown."
  cd ~/.vim/bundle/vim-markdown
  git pull 
fi
if [ ! -d ~/.vim/bundle/vim-sensible ]; then
  echo "Installing vim sensible."
  cd ~/.vim/bundle
  git clone https://github.com/tpope/vim-sensible.git
else
  echo "Updating vim sensible."
  cd ~/.vim/bundle/vim-sensible
  git pull
fi
if [ ! -d ~/.vim/bundle/command-t ]; then
  echo "Installing vim command-t."
  cd ~/.vim/bundle
  git clone https://github.com/wincent/command-t.git
  cd ./command-t/ruby/command-t
  ruby extconf.rb
  make
else
  echo "Updating vim command-t."
  cd ~/.vim/bundle/command-t
  git pull
  cd ~/.vim/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
fi

