
set nocompatible
let mapleader=" "

" Vundle - Plugin Manager {
    filetype off
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'honza/vim-snippets'
    Plugin 'vim-scripts/upAndDown'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/syntastic'
    Plugin 'ervandew/supertab'  
    Plugin 'sirver/ultisnips'
    Plugin 'kien/ctrlp.vim' 
    Plugin 'rking/ag.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tpope/vim-repeat'
    Plugin 'bling/vim-airline'

    " All of your Plugins must be added before the following line
    call vundle#end()
    filetype plugin indent on
" }

" airline {
    set laststatus=2
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
" 

" F Keys Mapping {
    " Paste mode toggling for copy pasting verbatim text when enabled.
    set pastetoggle=<F2>
    nmap <F3> = :NERDTreeToggle<CR>
    " Execute actual script
    autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
" }

" Remaps {

    " Change buffer sizes {  
        nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
        nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
        nnoremap <silent> <Leader>< :vertical res-10<CR>
        nnoremap <silent> <Leader>> :vertical res+10<CR>
    " }

    " Colon magic, allows to enter : without shift, faster {
        nnoremap , :
        nnoremap ; :
    " }

    " Change to next row in editor, not next wrapped line {
        nnoremap j gj
        nnoremap k gk
    " }

    " Clipboard {
        " Paste from clipboard
        " imap <C-v> <Esc>"+p
        " Copy visual selection to main clipboard
        vnoremap <C-c> "+y
    " }

    " Movement between splits  {
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>
    " }

    " Tabulation control {
        " Tabulate whole selected block
        vmap <Tab> >gv
        " Detabulate whole selected block
        vmap <S-Tab> <gv
    " }
" }

" Let ctrlp use ag if installed {
    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
" }

" Formatting {
    set tabstop=4     " An indentation every four columns
    set expandtab     " Tabs are spaces, not tabs
    set shiftwidth=4  " Use indents of 4 spaces
    set softtabstop=4 " Let backspace delete indent   4
    set nowrap        " Do not wrap long lines
    set autoindent    " Indent at the same level of the previous line
    set copyindent    " Copy previous indentation while autoindenting
    set number        " Line numbers
    set showmode      " Always show current mode
    set smartcase     " Ignore case if search pattern is lowercase, otherwise case-sensitive
    set smarttab      " Insert tabs at start of line according to shiftwidth, not tabstop
    set hlsearch      " Highlight search terms
    set incsearch     " Incremental search
    set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
" }

" Persist undo history {
    set undofile
    set undolevels=9999
    set undoreload=9999
    " Keep the undo file at home
    silent !mkdir -p $HOME/.vimundo >/dev/null 2>&1
    set undodir=$HOME/.vimundo//
" }
