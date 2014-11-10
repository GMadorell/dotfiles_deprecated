
" http://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
" Let ctrlp use ag if installed {
    if executable('ag')
        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    endif
" }

let g:ctrlp_show_hidden = 1
