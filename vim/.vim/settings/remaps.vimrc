" Remaps {

    " Change buffer sizes {  
        nnoremap <silent> <Leader>+ :exe "resize " . max([winheight(0) * 3/2, 2])<CR>
        nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
        nnoremap <silent> <Leader>< :vertical res-10<CR>
        nnoremap <silent> <Leader>> :vertical res+10<CR>
        nnoremap <silent> <Leader><< :vertical res85<CR>
        " Maximize the active buffer -> Set all other buffers to minimum size.
        nnoremap <silent> <Leader>mm :res 1000<CR> 
    " }

    " Colon magic, allows to enter : without shift, faster {
        nnoremap , :
        nnoremap ; :
    " }

    inoremap <Esc> <Esc><Esc><Esc>

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

    " variables case manipulation {
        " under_score_name to underScoreName {
            " Change word under the cursor
            nnoremap <Leader>kk vaw:s#\%V_\(\l\)#\u\1#g<CR>
            " Apply to visual selection
            vnoremap <Leader>kk :s#\%V_\(\l\)#\u\1#g<CR>
        " }
        " http://vim.wikia.com/wiki/Converting_variables_to_or_from_camel_case
        " for more
    " }
" }
