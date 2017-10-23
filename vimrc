set nocompatible

set termguicolors
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

" Syntax highlighting yo!
syntax on

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Use spaces instead of tabs
set expandtab
" Indent with only 2 spaces
set tabstop=2

" Pathogen
execute pathogen#infect()

set nobackup
set noswapfile

" kill arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

colorscheme colibri
