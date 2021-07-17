"^ leader
let mapleader = " "
nmap <bs> <space>
vmap <bs> <space>
"$

"^ insert
inoremap "" <c-g>u""<++><esc>F"i
inoremap $$ <c-g>u<esc>A
inoremap $(( <c-g>u$()<++><esc>F)i
inoremap &nu <c-g>u1>/dev/null 2>&1
inoremap '' <c-g>u''<++><esc>F'i
inoremap (( <c-g>u()<++><esc>F)i
inoremap ()) <c-g>u<esc>m0a<space>=><space><++><esc>`0a
inoremap 1nu <c-g>u1>/dev/null
inoremap 2nu <c-g>u2>/dev/null
inoremap << <c-g>u<><++><esc>F>i
inoremap <C-b> <esc>m0a<cr><esc>`0a
inoremap <C-j> <esc>:call InsertSkeleton()<cr>
inoremap <C-k> <c-g>u<esc>/<++><cr>cgn
inoremap <C-o> <esc>m0o<esc>`0a
inoremap KK <c-g>u<esc>/<++><cr>Nhm0:s/<++>//g<cr>`0a
inoremap UU <esc>viWUEa
inoremap ZZ <esc>:wq<cr>
inoremap [[ <c-g>u[]<++><esc>F]i
inoremap \(( <c-g>u\(\)<++><esc>F(a
inoremap docstr /**<cr>*<cr>*/<esc>=2kjA<space>
inoremap jk <esc>
inoremap modeline vim: ft= fdm= fmr=
inoremap uu <esc>viwUea
inoremap {{ <c-g>u{}<++><esc>F}i
inoremap {{{ <c-g>u{<cr>}<esc>O
"$

"^ normal
" nnoremap <leader>i m0=ip`0
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <leader>; :Commentary<cr>j
nnoremap <leader>B m0i<cr><esc>`0
nnoremap <leader>P :-1read ${CLIPBOARD}/00<cr>
nnoremap <leader>U m0viWU`0
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :Rg<space>
nnoremap <leader>i a<cr><esc>kddkPkJxJ
nnoremap <leader>mch :set cursorline! cursorcolumn!<cr>
nnoremap <leader>mcs :call CheatSheet()<cr>
nnoremap <leader>mhl :set hlsearch!<cr>
nnoremap <leader>mln :set number! relativenumber!<cr>
nnoremap <leader>msn :set signcolumn=yes<cr>
nnoremap <leader>mwr :set wrap!<cr>
nnoremap <leader>o m0o<esc>`0
nnoremap <leader>p :read ${CLIPBOARD}/00<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>r :%s/
nnoremap <leader>sa ggVG
nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>u m0viwU`0
nnoremap <leader>w :wa<cr>
nnoremap <leader>x :wincmd q<cr>
nnoremap <leader>z :wqa!<cr>
nnoremap L zc
"$

"^ visual
vnoremap <leader>@ :norm @q<cr>
vnoremap <leader>r :!rev<cr>
vnoremap <leader>s :sort<cr>
vnoremap <leader>y :w! ${CLIPBOARD}/00<cr>
"$

"^ completion-nvim
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
"$

"^ F4
augroup f4
    autocmd! f4
    autocmd FileType sh nnoremap <f4> :w<cr>:!shellcheck %<cr>
augroup end
"$

"^ F5
augroup f5
    autocmd! f5
    autocmd BufRead *config.def.h nnoremap <F5> :w<cr>:!mv -f config.h config.h.old && sudo make clean install<cr>
    autocmd BufRead *config.h nnoremap <F5> :w<cr>:!sudo make clean install<cr>
    autocmd BufRead *polybar/config nnoremap <F5> :w<cr>:!pkill -USR1 -x polybar<cr>
    autocmd BufRead *sxhkd/* nnoremap <F5> :w<cr>:!pkill -USR1 -x sxhkd<cr>
    autocmd FileType c nnoremap <F5> :w<cr>:!gcc % && ./a.out<cr>
    autocmd FileType cpp nnoremap <F5> :w<cr>:!g++ % && ./a.out<cr>
    autocmd FileType go nnoremap <F5> :w<cr>:!go run %<cr>
    autocmd FileType javascript nnoremap <F5> :w<cr>:!node %<cr>
    autocmd FileType ms nnoremap <F5> :w<cr>:!groff -ms -Tpdf % > %:p:h/groffout.pdf<cr>
    autocmd FileType sh nnoremap <F5> :w<cr>:!./%<cr>
    autocmd FileType tex nnoremap <F5> :w<cr>:!pdflatex %<cr>
    autocmd FileType xdefaults nnoremap <F5> :w<cr>:!xrdb %<cr>
augroup end
"$

"^ c(++)
augroup cpp
    autocmd! cpp
    autocmd FileType cpp inoremap << <<
    autocmd FileType c,cpp inoremap -- <c-g>u->
augroup end
"$

"^ go
augroup go
    autocmd! go
    autocmd FileType go inoremap :: :=
augroup end
"$

"^ sh
augroup sh
    autocmd! sh
    autocmd FileType sh nnoremap <leader>py :setf python<cr>
    autocmd FileType sh nnoremap <leader>sh :setf sh<cr>
augroup end
"$

"vim: fdm=marker fmr="^,"$
