
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
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/syntastic'
    Plugin 'ervandew/supertab'
    Plugin 'sirver/ultisnips'
    Plugin 'honza/vim-snippets'
    
    
    " All of your Plugins must be added before the following line
    call vundle#end()           
    filetype plugin indent on    
" }


" Syntax coloring {
    syntax enable
    syntax on

    " Solarized plugin {
        set t_Co=16
        let g:solarized_termcolors=16
        set background=dark
        colorscheme solarized
    " }
" }


" Remaps {
    " Global {
        " Interactive mode remaps {
            " Paste from clipboard
            imap <C-v> <C-r>+
        " }

        " Visual mode remaps {
            " Copy to main clipboard
            vnoremap <C-c> "+y  
            " Tabulate whole selected block
            vmap <Tab> >gv      
            " Detabulate whole selected block
            vmap <S-Tab> <gv    
        " }
    " }

    " Python {
        " Normal mode remaps {
            " Execute actual script
            autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
        " }
    " }
" }


" 
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Formatting {
    set tabstop=4                   " An indentation every four columns   
    set expandtab                   " Tabs are spaces, not tabs   
    set shiftwidth=4                " Use indents of 4 spaces   
    set softtabstop=4               " Let backspace delete indent   4
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
" }

" Line numbers
    set number

