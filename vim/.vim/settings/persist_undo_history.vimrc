
" Persist undo history {
    set undofile
    set undolevels=9999
    set undoreload=9999
    " Keep the undo file at home
    silent !mkdir -p $HOME/.vimundo >/dev/null 2>&1
    set undodir=$HOME/.vimundo//
" }
