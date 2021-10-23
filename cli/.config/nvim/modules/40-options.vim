set clipboard+=unnamedplus              " use Xorg clipboard register
set cmdheight=1                         " number of lines used for the command-line
set colorcolumn=80                      " columns to highlight
set encoding=utf-8                      " character encoding used in Vim: "latin1", "utf-8"
set expandtab                           " expand <Tab> to spaces in Insert mode
" set exrc                                " enable reading .vimrc/.exrc/.gvimrc in the current directory, not secure
set hidden                              " don't unload a buffer when no longer shown in a window
set ignorecase                          " ignore case when using a search pattern
set incsearch                           " show match for partly typed search command
set laststatus=0                        " 0, 1 or 2; when to use a status line for the last window
set mouse=a                             " list of flags for using the mouse
set nobackup                            " do not keep a backup after overwriting a file
set noerrorbells                        " do not ring the bell
set nohlsearch                          " do not highlight all matches for the last used search pattern
set noswapfile                          " do not use a swap file for this buffer
set nowrap                              " do not wrap long lines
set path+=**                            " list of directory names used for file searching
set scrolloff=8	                        " number of screen lines to show around the cursor
set shiftwidth=4                        " number of spaces used for each step of (auto)indent
set smartcase                           " override 'ignorecase' when pattern has upper case characters
set smartindent                         " do clever autoindenting
set softtabstop=4                       " if non-zero, number of spaces to insert for a <Tab>
set splitbelow splitright               " a new window is put below the current one to the right
set tabstop=4                           " number of spaces a <Tab> in the text stands for
set termguicolors                       " use GUI colors for the terminal
" set textwidth=80                        " line length above which to break a line
set undodir=~/.local/share/nvim/undo    " list of directories for undo files
set undofile                            " automatically save and restore undo history
set wildmenu                            " command-line completion shows a list of matches
set cursorline cursorcolumn             " highlight the screen line of the cursor
" set go=a                                " ???

filetype indent plugin on               " Filetype-specific plugins and indents
