syntax enable
syntax on

filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4

au BufNewFile,BufRead *.mjson set filetype=json

set nospell
set background=dark

au BufRead /tmp/mutt-* set tw=72

set foldmethod=syntax
set foldlevelstart=3
set foldopen=all

