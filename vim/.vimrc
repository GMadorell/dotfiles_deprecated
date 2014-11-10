
set nocompatible
let mapleader=" "
let maplocalleader="_"

" Vundle - Plugin Manager {
    filetype off
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'plasticboy/vim-markdown'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'bling/vim-airline'
    
    Plugin 'scrooloose/syntastic'

    Plugin 'Valloric/YouCompleteMe'
    Plugin 'ervandew/supertab'  
    Plugin 'sirver/ultisnips'
    Plugin 'honza/vim-snippets'

    Plugin 'kien/ctrlp.vim'
    Plugin 'rking/ag.vim'

    Plugin 'scrooloose/nerdtree'
    Plugin 'sjl/gundo.vim'

    Plugin 'scrooloose/nerdcommenter'
    Plugin 'godlygeek/tabular'
    Plugin 'tpope/vim-repeat'
    Plugin 'vim-scripts/upAndDown'
    
    Plugin 'xolox/vim-session'
    Plugin 'xolox/vim-misc'

    Plugin 'vim-scripts/Vim-R-plugin'

    " All of your Plugins must be added before the following line
    call vundle#end()
    filetype plugin indent on
" }

" Import configurations from the settings directory.
for f in split(glob('~/.vim/settings/*'), '\n')
    exe 'source' f
endfor

" Trigger warning when file is changed {
    " Check whenever cursor is still for updatetime milliseconds.
    set updatetime=2000 
    :au CursorHold * checktime
" }
