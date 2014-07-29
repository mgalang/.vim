" .vimrc File

"Forget compatibility with Vi. Who cares.
set nocompatible

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Bundles
Bundle 'jiangmiao/auto-pairs'
Bundle 'sleistner/vim-jshint'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-easymotion'
" Required by vim-snimate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'greyblake/vim-preview'

Plugin 'bling/vim-airline'
Plugin 'gregsexton/MatchTag'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'

" Write the old file out when switching between files.
" set autowrite

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = ","

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Set the color scheme.
colorscheme Monokai 

"Default tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" PHP tabs
autocmd FileType php set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Indent stuff
set smartindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows to the right
set splitright

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Change zen coding plugin expansion key to shift + e
let g:user_emmet_expandabbr_key = '<C-e>'

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" Navigate faster
nmap <s-j> 4j
nmap <s-k> 4k
nmap <s-h> 4h
nmap <s-l> 4l
"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Change directory to the current buffer when opening files.
set autochdir"

set showmatch " show matching brackets

" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>
