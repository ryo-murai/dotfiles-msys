source $HOME/.vim/encode.vim

" vundle settings
filetype off                   " required!

set rtp+=~/.vim/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" bundles
Bundle 'thinca/vim-quickrun'
Bundle 'tyru/open-browser.vim'
Bundle 'superbrothers/vim-quickrun-markdown-gfm'

let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser'
\   }
\ }

set tabstop=2
set expandtab
set number
set encoding=cp932     " for windows
"set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileencodings=utf-8,cp932,iso-2022-jp,default,latin
set smartcase
set ignorecase
syntax on

map <F5> ggO#!/bin/bash<ESC>
