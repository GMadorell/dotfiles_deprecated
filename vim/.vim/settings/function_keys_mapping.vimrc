
" Paste mode toggling for copy pasting verbatim text when enabled.
set pastetoggle=<F2>
nmap <silent> <F3> = <Esc>:NERDTreeToggle<CR>
nmap <F4> = :SyntasticCheck<CR>
nnoremap <F5> :GundoToggle<CR>
" Execute actual script
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
