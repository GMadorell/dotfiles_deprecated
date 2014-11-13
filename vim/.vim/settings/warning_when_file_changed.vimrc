
" Trigger warning when file is changed {
    " Check whenever cursor is still for updatetime milliseconds.
    set updatetime=2000 
    :au CursorHold * checktime
" }
