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

