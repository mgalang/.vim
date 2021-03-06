" ===================================================================
" My Vimrc File
" ===================================================================

" No VI compatibility
set nocompatible

" required
filetype off

" Vundle plugin management
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'

" ===================================================================
" PLUGINS
" ===================================================================
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sleistner/vim-jshint'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'gregsexton/MatchTag'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Vundle end
call vundle#end()

"Enable filetypes
filetype plugin on
filetype indent on
syntax on


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
colorscheme Tomorrow-Night

"Default whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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

"Align inside braces
nmap <leader>ai =i{

"Align the whole page
nmap <leader>aa mxgg=G'x

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

"Disable multiline close
let g:AutoPairsMultilineClose = 0

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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let php_sql_query=1
let php_htmlInStrings=1

" semicolon to the end
inoremap ;; <End>;<CR>

" Quick tab switching using leader key
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" PHP array to object notation
nnoremap <leader>ato V :s/\%V\$\(.*\)\['\(.*\)'\]/$\1->\2/g<CR>

"Easymotion mappings
nmap <leader>s <Plug>(easymotion-s)
nmap <leader>w <Plug>(easymotion-bd-w)

" Bind ctrlp to leader p
nnoremap <leader>p :CtrlP<Cr>
nnoremap <leader>pf :CtrlPFunky<Cr>

"------------------------"
"YouCompleteMe
"________________________"

let g:ycm_autoclose_preview_window_after_completion=1

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"

let nerdtree_tabs_open_on_gui_startup=0

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"Nerdtree toggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_console_startup=0

" Change directory to the current buffer when opening files.
set autochdir"

" Whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" filetypes
au BufNewFile,BufRead *.jinja set filetype=jinja

" Remove all whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Do not check php files with phpcs
let g:syntastic_php_checkers = ['php', 'phpmd']

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Quick window switching
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>
