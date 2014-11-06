
# Lines added by the Vim-R-plugin command :RpluginConfig (2014-nov-05 17:19):
if(interactive()){
    if(nchar(Sys.getenv("DISPLAY")) > 1)
        options(editor = 'gvim -f -c "set ft=r"')
    else
        options(editor = 'vim -c "set ft=r"')
    # See ?setOutputColors256 to know how to customize R output colors
    # library(colorout)
    # library(setwidth)
    library(vimcom)
    # See R documentation on Vim buffer even if asking for help in R Console:
    if(Sys.getenv("VIM_PANE") != "")
        options(pager = vim.pager)
}
