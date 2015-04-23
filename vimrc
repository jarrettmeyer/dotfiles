""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
set history=1000
set hidden      " Hide buffers, instead of closing them.
set number      " Show line numbers.
set ruler       " Show cursor location.
set showcmd	    " Show the command bar.
set directory=$HOME/.vim/swapfiles//
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
let mapleader=","


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch       " highlight matching search results
set incsearch      " use incremental search
set ignorecase     " ignore case when searching...
set smartcase      " ...unless caps were explicitly used in search


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T settings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help:
"
" These are just the commands that I tend to forget.
"
" :bd                  Delete buffer (close).
" :Helptags            Generate help tags for loaded bundles.
" :scriptnames         List what scripts were loaded.
" :set runtimepath?    Show the script path(s).
