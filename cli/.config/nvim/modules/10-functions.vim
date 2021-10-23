let g:skeldir = "~/.config/nvim/skeletons/"
function! InsertSkeleton()
    " Insert a skeleton.
    normal! viwd
    let l:skel = @"
    execute "normal! m0i\<cr>"
    execute "-1read " . g:skeldir . &filetype . "-" . l:skel
    execute "normal! `0J=ip`0"
    execute "normal! /<++>\<cr>4x"
    startinsert
endfunction
