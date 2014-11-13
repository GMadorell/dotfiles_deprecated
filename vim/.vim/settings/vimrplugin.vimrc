if ExistsPlugin("vim-r-plugin")
" vimrplugin settings {
    " Lines added by the Vim-R-plugin command :RpluginConfig (2014-nov-05 17:19):
    " Press the space bar to send lines (in Normal mode) and selections to R:
    " vmap <Space> <Plug>RDSendSelection
    " nmap <Space> <Plug>RDSendLine
    let vimrplugin_term = "terminator"
    let vimrplugin_term_cmd = "terminator --title R -x"
" }

    " Remove annoying mapping that inserted <- instead of _ in insert mode.
    autocmd FileType r imap <LocalLeader>_ <NOP>
endif
