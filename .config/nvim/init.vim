" =================== PLUGINS ======================
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
"
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim') " autocomplete
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call dein#add('w0rp/ale') " linting
    call dein#add('mhinz/vim-signify') " version control gutter symbols
    call dein#add('janko-m/vim-test') " test runner
    call dein#add('Shougo/neosnippet.vim') " code snippets
    call dein#add('Shougo/neosnippet-snippets') " code snippet collection
    call dein#add('honza/vim-snippets') " more snippets
    call dein#add('Raimondi/delimitMate') " Automatic closing of quotes, brackets, etc.
    call dein#add('tpope/vim-commentary') " Comment code easily
    call dein#add('tpope/vim-surround') " Surround with quotes, brackets
    call dein#add('tpope/vim-repeat') " Enable plugins to use repeat '.'
    call dein#add('tpope/vim-fugitive') " Git wrapper
    call dein#add('sheerun/vim-polyglot') " language specific syntax/indent
    call dein#add('cloudhead/neovim-fuzzy') " language specific syntax/indent
    call dein#add('francoiscabrol/ranger.vim') " ranger file manager integration
    call dein#add('rbgrouleff/bclose.vim') " close buffer without closing window 
    call dein#add('wellle/targets.vim') " new text objects
    call dein#add('editorconfig/editorconfig-vim') " configures vim according to .editorconfig file
    call dein#add('itchyny/lightline.vim') " aesthetics
    call dein#add('JuliaEditorSupport/julia-vim') " julia lang support
    call dein#add('https://github.com/alvan/vim-closetag') " close HTML tags automatically
    call dein#add('posva/vim-vue') " vue files syntax support
    call dein#add('eugen0329/vim-esearch') " global search
    call dein#add('tpope/vim-sleuth') " file indent detection


    call dein#add('dikiaap/minimalist') " colorscheme

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
"
" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

" ===================== COLORSCHEME =================
colorscheme minimalist

" ===================== SPACES & TABS ===============
set shiftwidth=4        " tab width
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces per TAB when editing
set expandtab           " tabs are spaces

" ===================== USER INTERFACE ==============
set relativenumber      " show relative line numbers
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
let g:deoplete#enable_at_startup = 1
" F4 to toggle Nuake
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
let g:neosnippet#snippets_directory = [
            \ '~/.cache/dein/repos/github.com/honza/vim-snippets/snippets',
            \ '~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets']

"auto indent on enter
let g:delimitMate_expand_cr = 1     
let delimitMate_matchpairs = "(:),[:],{:}"

" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"

" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gbl :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>
nnoremap <C-p> :FuzzyOpen<CR>

" tests
let test#strategy = "neovim"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>     
nmap <silent> <leader>ts :TestSuite<CR>

" julia latex-to-unicode as you type
:let g:latex_to_unicode_auto = 1

runtime macros/matchit.vim

let g:closetag_filetypes = 'html,xhtml,phtml, vue'

" Start python debugging server
command! -nargs=* Pydb call Pydb( '<args>' )
fu! Pydb(args)
    execute "silent !pydbgp % ".a:args." &"
endfunction

let g:ale_linters = { 'javascript': ['prettier', 'eslint'] }
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
call esearch#map('<leader>ss', 'esearch')
call esearch#map('<leader>sw', 'esearch-word-under-cursor')
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
