let mapleader = "\<Space>"

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'stephpy/vim-yaml'
Plug 'vim-ruby/vim-ruby'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'ngmy/vim-rubocop'
Plug 'zivyangll/git-blame.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'elzr/vim-json'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

"Tinymode maps
nmap          <C-W>+     <C-W>+<SID>ws
nmap          <C-W>-     <C-W>-<SID>ws
nn <script>   <SID>ws+   <C-W>+<SID>ws
nn <script>   <SID>ws-   <C-W>-<SID>ws
nmap          <C-W><     <C-W><<SID>ws
nmap          <C-W>>     <C-W>><SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nmap          <SID>ws    <Nop>

"Prettier Config
let g:prettier#autoformat = 0
autocmd BufWritePre *.yaml,*.js Prettier

"tiny mode config
let tinym_ex_modes = 'cytab,winsize,less'

" Persistent undo
set undodir=~/.vim/undo/
set undolevels=1000
set undoreload=10000
set undofile

"General Config
syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set list lcs=eol:·
set nowrap
set cursorline
set laststatus=2
set statusline+=%F
set foldmethod=indent
set foldlevel=99
set encoding=utf8
set tags=./.git/tags,tags;
set incsearch
set hlsearch

set backspace=
"set guifont=Hack\ Nerd\ Font:h14
filetype plugin indent on
autocmd FileType ruby setl omnifunc=syntaxcomplete#Complete

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

"Numbers
set number relativenumber
set nu rnu

"Vim git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"vim json conceal workaround
let g:vim_json_syntax_conceal = 0

"rust config
let g:rustfmt_autosave = 1

"Remove blank spaces at end of line
autocmd BufWritePre *.rb,*.js,*.jsx,*.yaml :%s/\s\+$//e

"copy filename/path to clipboard
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-p> :GitFiles<CR>
nnoremap <C-f> :Rg<Cr>

set rtp+=/usr/local/opt/fzf

"indentation rules
autocmd FileType markdown setl shiftwidth=4 tabstop=4
