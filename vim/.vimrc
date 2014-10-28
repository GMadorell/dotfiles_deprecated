
set nocompatible           
filetype off                  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()           
filetype plugin indent on    
" ~~~~ End of vundle plugin manager


syntax enable

" Line numbers
set number

" Solarized plugin
set t_Co=16
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
