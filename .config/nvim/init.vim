" ===================== PLUGINS =====================
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'dikiaap/minimalist' " colorscheme
Plug 'wellle/targets.vim' " new text objects 
Plug 'tpope/vim-repeat' " plugins repeat with .
Plug 'tpope/vim-surround' " replace surrounding brackets, quotes
Plug 'tpope/vim-commentary' " comment lines easily
Plug 'tpope/vim-sleuth' " file indent detection
Plug 'junegunn/fzf.vim'
call plug#end()

" ===================== COLORSCHEME =================
colorscheme minimalist

" ===================== SPACES & TABS ===============
set shiftwidth=4        " tab width
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces per TAB when editing
set expandtab           " tabs are spaces

" ===================== USER INTERFACE ==============
" set relativenumber      " show relative line numbers
set number              " show current line number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set title               " set terminal's title to file name

" ===================== SEARCHING ====================
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set smartcase           " case insensitive when lowercase-only search
set ignorecase
" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" ===================== SCROLLING ====================
set scrolloff=100       "Start scrolling when we're N lines away from margins
set sidescrolloff=30
set sidescroll=5

" ===================== COPY & PASTE ====================
" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" ===================== EDITING ====================
" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv

" ===================== LEADER ======================
let mapleader=","       " leader is comma

" ===================== SPLITS =====================
set splitright          " new splits to the right
nmap <C-h> <C-w>h      
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" ===================== BACKUPS =====================
"" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ===================== PLUGIN CONFIG ===============
" Comment map
nmap <Leader>c gcc      
" Line comment command
xmap <Leader>c gc 
nnoremap <silent> <leader>f :FZF<cr>
" ================ COMPLETION =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
