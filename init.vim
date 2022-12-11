let mapleader= " "
syntax on

set incsearch
set number relativenumber
set encoding=utf-8
set noswapfile
set nobackup
set undodir=~/.vim/undo
set undofile 
set nohlsearch
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set splitbelow splitright
set colorcolumn=80
highlight ColorColumn guibg=reverse cterm=reverse

let g:lsc_auto_map = v:true

runtime plug.vim
runtime maps.vim

