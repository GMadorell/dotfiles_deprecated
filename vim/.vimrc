
" Activate this variable if you want to use a minimal subset
" of the installed vim functionality.
let MINIMAL_VIM = 0

set nocompatible
let mapleader=" "
let maplocalleader="_"

" Vundle - Plugin Manager {
    filetype off
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'altercation/vim-colors-solarized'
    Plugin 'vim-scripts/upAndDown'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'godlygeek/tabular'

    if ! MINIMAL_VIM
        Plugin 'plasticboy/vim-markdown'
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

        Plugin 'tpope/vim-repeat'
        
        Plugin 'xolox/vim-session'
        Plugin 'xolox/vim-misc'

        Plugin 'vim-scripts/Vim-R-plugin'
    endif

    " All of your Plugins must be added before the following line
    call vundle#end()
    filetype plugin indent on
" 

function! ExistsPlugin(name) 
" Checks if a given name exists in the bundle folder.
" Note that the name in the bundle folder might not be exactly the same
" as the plugin name.
python << endpython
import os
import vim

name = vim.eval("a:name")
DOTFILES_DIR = os.path.expanduser(os.path.join("~", "dotfiles"))
BUNDLES_DIR = os.path.join(DOTFILES_DIR, "vim", ".vim", "bundle")

bundles = [d for d in os.listdir(BUNDLES_DIR) 
           if os.path.isdir(os.path.join(BUNDLES_DIR, d))] 
bundles = map(lambda dir_name: dir_name.lower(), bundles)

is_bundle = 1 if name.lower() in bundles else 0
vim.command("return {}".format(is_bundle))
endpython
endfunction


" Import configurations from the settings directory.
for f in split(glob('~/.vim/settings/*'), '\n')
    exe 'source' f
endfor

