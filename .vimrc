set nocompatible

" Line number helpers
set nu
set ruler

" Syntax highlighting
syntax on
filetype plugin indent on

" Defaults
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set iskeyword-=_

" Ruby
autocmd FileType ruby set ts=2|set shiftwidth=2|set expandtab|set autoindent|set softtabstop=2

" Search
set incsearch
set nohlsearch

" Viewports
set splitright
set splitbelow

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Prettiness
if has("gui_running")
    set guioptions-=T
    colo slate
    " colo underwater-mod
    hi CursorLine guibg=darkred
endif

" Clojure
" let clj_highlight_builtins = 1
