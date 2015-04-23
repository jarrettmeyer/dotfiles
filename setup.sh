#!/usr/bin/env bash

# Install oh-my-zsh!
# https://github.com/robbyrussell/oh-my-zsh
if [ -z ZSH ]; then
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  echo "Installed Oh-My-ZSH."
else
  echo "Oh-My-ZSH is already installed to ${ZSH}."
fi

# Delete these folders.
if [ -d ~/.vim/autoload ]; then
  rm -rf ~/.vim/autoload
fi

if [ -d ~/.vim/bundle ]; then
  rm -rf ~/.vim/bundle
fi

# Create required folders.
mkdir ~/.vim/autoload
mkdir ~/.vim/bundle

# Download pathogen.
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Download bundles.
git clone git@github.com:pangloss/vim-javascript.git  ~/.vim/bundle/vim-javascript
git clone git@github.com:tpope/vim-markdown.git       ~/.vim/bundle/vim-markdown
git clone git@github.com:tpope/vim-sensible.git       ~/.vim/bundle/vim-sensible
git clone git@github.com:wincent/command-t.git        ~/.vim/bundle/command-t

# Create symbolic links.
rm ~/.gemrc
ln -s ${PWD}/gemrc ~/.gemrc
rm ~/.vimrc
ln -s ${PWD}/vimrc ~/.vimrc
rm ~/.zshrc
ln -s ${PWD}/zshrc ~/.zshrc
