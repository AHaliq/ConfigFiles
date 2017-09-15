" Personal configuration extended from default vimrc file.
" 
" Last change:	2017 Sep 15

" Plugins
call plug#begin('~/.vim/bundle/')
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
call plug#end()

" Configue
" Tabs as 2 spaces
set tabstop=2 shiftwidth=2 expandtab
" Clipboard
set clipboard=unnamed
" Clear search on insert
set hlsearch
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

" Maps
" Normal insert
noremap <C-i> A
" Normal motion; fast <S-x>
noremap <S-h> b
noremap <S-j> <C-d>
noremap <S-k> <C-u>
noremap <S-l> w
" Normal motion; extremize <C-x>
noremap <C-h> 0
noremap <C-j> L
noremap <C-k> H
noremap <C-l> $
" Normal edit
"  <C-o> append next line to tail of current
"  U     redo
"  <C-y> copy to clipboard
noremap <C-o> :join<CR>
noremap U <C-r>
noremap <C-y> "+y
" Normal pane management; navigate zx
noremap zh <C-w>h
noremap zj <C-w>j
noremap zk <C-w>k
noremap zl <C-w>l
noremap z= <C-w>=
" Normal pane management; create z<S-x>
noremap zH :leftabove vnew<CR>
noremap zJ :rightbelow new<CR>
noremap zK :leftabove new<CR>
noremap zL :rightbelow vnew<CR>
" Normal pane management; swap z<C-x>
noremap z<C-h> <C-w>H
noremap z<C-j> <C-w>J
noremap z<C-k> <C-w>K
noremap z<C-l> <C-w>L
" Normal tab management; Zx
noremap ZZ :tabe<CR>
noremap Zh :tabfirst<CR>
noremap Zj :tabp<CR>
noremap Zk :tabn<CR>
noremap Zl :tablast<CR>
" Normal pane/tab management; close
"  qq    close
"  q!    force close
"  qw    save and close
noremap qq :q<CR>
noremap q! :q!<CR>
noremap qw :x<CR>

" Plugins; plug
"  maps
noremap .11 :PlugInstall<CR>
noremap .12 :PlugUpdate<CR>

" Plugins; signify
"  configure
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1
set updatetime=100
"  theme
hi SignifySignAdd             cterm=bold ctermbg=white ctermfg=green
hi SignifySignChange          cterm=bold ctermbg=white ctermfg=yellow
hi SignifySignDelete          cterm=bold ctermbg=white ctermfg=red
hi SignifySignChangeDelete    cterm=bold ctermbg=white ctermfg=red
hi SignifySignDeleteFirstLine cterm=bold ctermbg=white ctermfg=red

" Plugins; netrw
"  configure
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.swp$'
let g:netrw_browse_split=0
"  theme
hi netrwTreeBar ctermfg=white
noremap .2 :topleft 30vnew<CR>:e .<CR>

" Plugins; sneak
"  configure
hi! link Sneak Search

" Plugins; tabular
noremap t :Tabularize /

" Theme
hi NonText      ctermfg=white
hi SignColumn   ctermbg=white
hi Normal       ctermbg=none
hi VertSplit    cterm=none    ctermbg=white
hi StatusLineNC cterm=none    ctermfg=white   ctermbg=white
hi StatusLine   ctermfg=white ctermbg=white
hi TabLineFill  cterm=none
hi TabLineSel   ctermfg=white ctermbg=black
hi TabLine      ctermfg=white ctermbg=white
hi Title        ctermfg=white
hi LineNr       ctermfg=white
hi CursorLineNr ctermbg=white ctermfg=white
hi CursorLine   cterm=none    ctermbg=white
hi NonText      ctermfg=white
hi MatchParen   ctermbg=none  cterm=underline
hi Search       ctermbg=black ctermfg=white
set fillchars+=vert:\ 
