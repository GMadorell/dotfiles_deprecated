syntax enable
syntax on

if ExistsPlugin("vim-colors-solarized")
    set t_Co=16
    let g:solarized_termcolors=16
    set background=dark
    colorscheme solarized
endif

