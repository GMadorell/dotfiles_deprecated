" Remaps {

    " Change buffer sizes {  
        nnoremap <silent> <Leader>+ :exe "resize " . max([winheight(0) * 3/2, 2])<CR>
        nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
        nnoremap <silent> <Leader>< :vertical res-10<CR>
        nnoremap <silent> <Leader>> :vertical res+10<CR>
        nnoremap <silent> <Leader><< :vertical res85<CR>
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
