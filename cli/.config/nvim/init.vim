"     ____                _____               __     ___
"    / ___|  ___  _   _  |  ___| __ ___  ___  \ \   / (_)_ __ ___
"    \___ \ / _ \| | | | | |_ | '__/ _ \/ _ \  \ \ / /| | '_ ` _ \
"     ___) | (_) | |_| | |  _|| | |  __/  __/   \ V / | | | | | | |
"    |____/ \___/ \__, | |_|  |_|  \___|\___|    \_/  |_|_| |_| |_|
"                 |___/

"^----- INSTRUCTIONS -----------------------------------------------------------

" To enable modules, create links from modules/ to init.d/ like this:
"
" $ cd ~/.config/nvim/init.d
" $ ln -sf ../modules/options.vim ./90-options.vim
"
" Modules are loaded in alpha-numerical order, so it is recommended to make use
" of a numbering scheme as in the above example to manage dependencies. While
" efforts are made to make modules that are as sequence-independent as possible,
" conditions may arise in which one module is dependent on another and should be
" given a number higher than the prerequisite module. Namely, it is important to
" ensure that modules with the word 'vimplug' in their name appear after the
" 'vimplug-begin.vim' and before the 'vimplug-end.vim' modules, and the modules
" with word 'settings' appear later:
"
" 50-vimplug-begin.vim
" 51-vimplug-coc.vim
" 52-vimplug-end.vim
" 53-vimplug-settings-coc.vim
" 53-vimplug-settings.vim

"$

"^
runtime! plugin/*.vim
"$

" vim: fdm=marker fmr="^,"$
