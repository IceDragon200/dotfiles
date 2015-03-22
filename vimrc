set nocompatible

set hidden
set ruler
set nowrap
set number
set numberwidth=5
hi LineNr ctermfg=black ctermbg=grey

set history=1000
set autoread

set encoding=utf-8
set fileencoding=utf-8

set diffopt+=iwhite

set background=dark
set backspace=indent,eol,start
set cursorline


syntax on

autocmd BufWritePre * :%s/\s\+$//e

execute pathogen#infect()

set nobackup
set noswapfile

" kill arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
