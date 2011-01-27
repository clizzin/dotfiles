set nocompatible

" Line number helpers
set nu
set ruler

" Syntax highlighting
syntax on
filetype plugin indent on

" Use four spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Indent
set autoindent
set smartindent

" Search
set incsearch
set hlsearch

" Prettiness
if has("gui_running")
    set guioptions-=T
    " colo slate
    colo underwater-mod
    hi CursorLine guibg=darkred
endif

" Clojure
" let clj_highlight_builtins = 1
