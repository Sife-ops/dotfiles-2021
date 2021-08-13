function! CheatSheet()
    " Search cheat sheet repositories.
    let l:terms = join(split(input('cht.sh: '), " "), "+")
    silent execute "!curl cht.sh/" . &ft . "/" . l:terms . " > /tmp/cht.sh-$(id -un)"
    execute "split"
    execute "term cat /tmp/cht.sh-$(id -un)"
endfunction

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

" function! NewSkeleton()
"     create a new skeleton
"     let l:lol = input("sup:")
"     input("sup:")
"     let l:ree = &ft . l:lol
"     let l:fdsa = "/tmp/fdsa/lol"
"     exec "'<,'>w! " . l:fdsa
" endfunction
