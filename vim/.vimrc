
" Vundle - Plugin Manager {
    set nocompatible
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

    " Python {
        " Normal mode remaps {
            " Execute actual script
            autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
        " }

        " comment line or selection with Ctrl-N,Ctrl-N
        autocmd FileType python nnoremap  <C-N><C-N>    mn:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR>:noh<CR>`n
        autocmd FileType python inoremap  <C-N><C-N>    <C-O>mn<C-O>:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR><C-O>:noh<CR><C-O>`n
        autocmd FileType python vnoremap  <C-N><C-N>    mn:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR>:noh<CR>gv`n

        " uncomment line or selection with Ctrl-N,N
        autocmd FileType python nnoremap  <C-N>n     mn:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR>:s/^#$//ge<CR>:noh<CR>`n
        autocmd FileType python inoremap  <C-N>n     <C-O>mn<C-O>:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR><C-O>:s/^#$//ge<CR><C-O>:noh<CR><C-O>`n
        autocmd FileType python vnoremap  <C-N>n     mn:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR>gv:s/#\n/\r/ge<CR>:noh<CR>gv`n
    " }
" }


" UltiSnips and YCM { 
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
" }

" UltiSnips Configuration {
    autocmd FileType python UltiSnipsAddFiletypes python
    autocmd FileType mkd UltiSnipsAddFiletypes mkd.md.markdown
" }

" Formatting {
    set tabstop=4                   " An indentation every four columns   
    set expandtab                   " Tabs are spaces, not tabs   
    set shiftwidth=4                " Use indents of 4 spaces   
    set softtabstop=4               " Let backspace delete indent   4
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set list listchars=tab:»·,trail:·,nbsp:· "Display extra whitespace
" }

" Line numbers
    set number
