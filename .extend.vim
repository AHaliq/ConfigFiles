" Personal configuration extended from default vimrc file.
" 
" Last change:	2018 Mar 14
let g:ale_disable_lsp = 1
" Plugins
call plug#begin('~/.vim/bundle/')
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'jelera/vim-javascript-syntax'
Plug 'purescript-contrib/purescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
call plug#end()

" Coc and Ale
let g:coc_disable_startup_warning = 1
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Tmuxline
noremap <C-t> :Tmuxline lightline <CR>

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
" Normal pane management; resize z<C-x>
noremap z<C-h> :vertical resize -5<CR>
noremap z<C-j> :resize -5<CR>
noremap z<C-k> :resize +5<CR>
noremap z<C-l> :vertical resize +5<CR>
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
hi SignifySignAdd             cterm=bold ctermbg=green  ctermfg=black
hi SignifySignChange          cterm=bold ctermbg=yellow ctermfg=black
hi SignifySignDelete          cterm=bold ctermbg=red    ctermfg=black
hi SignifySignChangeDelete    cterm=bold ctermbg=red    ctermfg=black
hi SignifySignDeleteFirstLine cterm=bold ctermbg=red    ctermfg=black

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
" start search  s{char}{char}
" next          ;
" prev          ,
"  configure
hi! link Sneak Search

" Plugins; tabular
noremap t :Tabularize /

" Theme
syntax on
set t_Co=256
colorscheme onehalfdark
set background=dark
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ }
let g:tmuxline_theme = 'onehalfdark'
" JS Template Syntax Highlighting
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

hi NonText      ctermfg=white
hi SignColumn   ctermbg=none
hi Normal       ctermbg=none
hi VertSplit    cterm=none    ctermfg=black   ctermbg=none
hi StatusLineNC cterm=none    ctermfg=black   ctermbg=none
hi StatusLine   cterm=bold    ctermfg=white   ctermbg=black
hi TabLineFill  cterm=none
hi TabLineSel   cterm=bold    ctermfg=white ctermbg=black
hi TabLine      cterm=bold    ctermfg=black ctermbg=none
hi Title        ctermfg=white
hi LineNr       ctermfg=white
hi CursorLineNr ctermbg=white ctermfg=black
hi CursorLine   cterm=none    ctermbg=white
hi NonText      ctermfg=black
hi MatchParen   ctermbg=none  cterm=underline
hi Search       ctermbg=black ctermfg=white
set laststatus=2
set fillchars+=vert:│
