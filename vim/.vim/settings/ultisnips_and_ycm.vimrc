if ExistsPlugin("youcompleteme") && ExistsPlugin("ultisnips")
" Ultisnips and YCM compatibility {
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<c-j>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }
endif

if ExistsPlugin("ultisnips")
" Ultisnips {
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    " Snippet files for different file formats.
    autocmd FileType python UltiSnipsAddFiletypes python
    autocmd FileType mkd UltiSnipsAddFiletypes mkd.md.markdown
" }
endif

if ExistsPlugin("youcompleteme")
" YCM {
    let g:ycm_autoclose_preview_window_after_completion = 1
" }
endif
