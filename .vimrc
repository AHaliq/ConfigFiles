scriptencoding utf-8
set encoding=utf-8

" Enable syntax highlighting if available
filetype on
if has("syntax")
  syntax on
endif

" Go to last edited area when reopen file
" Load indentation rules
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  filetype plugin indent on
endif

" VIM specific
set showcmd     " Show (partial) command in status line
set showmatch   " Show matching brackets
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set mouse=a
set ttymouse=xterm2

" Spaces for tab key
set tabstop=2 shiftwidth=2 expandtab

" Relative Line Numbers
set rnu
set ruler

" Navigation
map ,-        :tabp<CR>
map ,=        :tabn<CR>
map ,<Left>   <C-w><Left>
map ,<Right>  <C-w><Right>
map ,<Up>     <C-w><Up>
map ,<Down>   <C-w><Down>

" Panels
map <k       :new<CR>
map <l       :vnew<CR>
map <m       :tabnew<CR>
map <<LEFT>  :vertical res -
map <<RIGHT> :vertical res +
map <<UP>    :res +
map <<DOWN>  :res -

" Open Plugins
map ,m :NERDTreeToggle<CR>
map ,k :Tagbar<CR>
map ,l :Hoogle<Space>
map ,. :Magit<CR>
map ,n :Tabularize<Space>/
map ,N :TabFirst<Space>
map ,j :SyntasticCheck<CR>

" Close panes
map .l :HoogleClose<CR>
map .. :q<CR>
map .w :w<CR>:q<CR>

" Theme
hi Normal       ctermbg=none
hi VertSplit    cterm=none        ctermfg=black
hi StatusLineNC cterm=none        ctermfg=black
hi StatusLine   ctermbg=lightblue ctermfg=black
hi TabLineFill  cterm=none        ctermfg=lightblue
hi TabLineSel   ctermfg=magenta   ctermbg=black
hi TabLine      cterm=none        ctermbg=black
set fillchars+=vert:│

" completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Tabular macros
command! -nargs=1 -range TabFirst exec <line1> . ',' . <line2> . 'Tabularize /^[^' . escape(<q-args>, '\^$.[?*~') . ']*\zs' . escape(<q-args>, '\^$.[?*~')

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"autocmd VimEnter * SyntasticToggleMode

" Tagbar & Hasktags
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }

" Pathogen
execute pathogen#infect()
Helptags
