
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run in vim mode all the time.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden         " hide buffers, instead of closing them

syntax on                    " turn on syntax highlighting
filetype plugin indent on    " detect filetype and use indent rules

set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set ruler             " show cursor position
set showmatch
set number            " show line numbers
set shell=bash
set showcmd
let mapleader=","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly edit and source .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>ev :e $MYVIMRC
nmap <leader>sv :so $MYVIMRC


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Runing Tests
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously marked file.
  let in_test_file = match(expand("%"), '_spec.rb$') != -1
  if in_test_file
    call SetTestFile()
  elseif
    !exists("t:jm_test_file")
    return
  endif
  call RunTests(t:jm_test_file . command_suffix) 
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:jm_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo

  if filereadable("Gemfile")
    exec ":!bundle exec rspec --color " . a:filename
  else
    exec ":!rspec --color " . a:filename
  endif
endfunction

