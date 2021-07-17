let s:plugins = "~/.config/nvim/plugin"

if filereadable(expand(glob(s:plugins."/*-completion-nvim.vim")))
    set completeopt=menuone,noinsert,noselect
    set shortmess+=c
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
endif

if filereadable(expand(glob(s:plugins."/*-nvim-lspconfig.vim")))
    lua require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }
    lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
    lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
    lua require'lspconfig'.denols.setup{ on_attach=require'completion'.on_attach }
endif

if filereadable(expand(glob(s:plugins."/*-gruvbox.vim")))
    colorscheme gruvbox
    set background=dark
    hi Normal guibg=0
endif

if filereadable(expand(glob(s:plugins."/*-vim-code-dark.vim")))
    colorscheme codedark
    set background=dark
    hi Normal guibg=0
endif

if filereadable(expand(glob(s:plugins."/*-vim-hexokinase.vim")))
    let g:Hexokinase_highlighters = ['backgroundfull']
endif

" vim: fdm=marker fmr="^,"$
