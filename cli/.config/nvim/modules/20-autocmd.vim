augroup allbufs
    autocmd! allbufs
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufWritePre * %s/\s\+$//e
augroup end
