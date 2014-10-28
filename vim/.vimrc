
" Vundle - Plugin Manager {
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
" }


" Syntax coloring {
    syntax enable

    " Solarized plugin {
        set t_Co=16
        let g:solarized_termcolors=16
        set background=dark
        colorscheme solarized
    " }
" }


" Remaps {

    " Visual mode remaps {
        vnoremap <C-c> "+y  " Copy to main clipboard
        vmap <Tab> >gv      " Tabulate whole selected block
        vmap <S-Tab> <gv    " Detabulate whole selected block
    " }
    
" }


" Tab control {
    set tabstop=8
    set expandtab
    set shiftwidth=4
    set softtabstop=4
" }

" Line numbers
    set number

