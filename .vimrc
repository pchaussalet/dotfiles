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

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'whatyouhide/vim-gotham'
Plug 'crusoexia/vim-monokai'
Plug 'Lokaltog/vim-distinguished'
" Plug 'YorickPeterse/happy_hacking.vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
call plug#end()
" colorscheme happy_hacking
colorscheme gruvbox

set foldmethod=syntax
set foldlevelstart=3
set foldopen=all

