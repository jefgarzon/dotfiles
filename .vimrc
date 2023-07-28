let mapleader = "\<Space>"

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/2.x' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'stephpy/vim-yaml'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'yggdroot/indentline'
Plug 'ngmy/vim-rubocop'
Plug 'zivyangll/git-blame.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'elzr/vim-json'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'misterbuckley/vim-definitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'cakebaker/scss-syntax.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim'
Plug 'Jorengarenar/fauxClip'
Plug 'dense-analysis/ale'
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
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.yaml,*.js,*.jsx,*.scss Prettier

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
set list lcs=eol:·,tab:\ \ 
set nowrap
set cursorline
set laststatus=2
set statusline+=%F
set foldmethod=indent
set foldlevel=99
set encoding=UTF-8
set incsearch
set hlsearch
set mmp=5000

set backspace=
"set guifont=Hack\ Nerd\ Font:h14
filetype plugin indent on
autocmd FileType ruby setl omnifunc=syntaxcomplete#Complete

" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

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

"On Save
autocmd BufWritePre *.rb,*.js,*.yaml,*.jsx,*.scss :%s/\s\+$//e

"copy filename/path to clipboard
"
"nmap ,cs :let @+=expand("%")<CR>
"nmap ,cl :let @+=expand("%:p")<CR>
"
"following is workaround for WSL
nmap ,cs :call system(fauxClip_copy_cmd, expand("%"))<CR>
nmap ,cl :call system(fauxClip_copy_cmd, expand("%:p"))<CR>

"NERDTree
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nnoremap <C-@> :NERDTreeFind<CR>

"FuzzyFile
noremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<Cr>
inoremap <expr> <C-x><C-f> fzf#vim#complete#path('rg --files')
inoremap <expr> <C-x><C-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

nnoremap <silent> <Leader>F :Rg <C-R><C-W><CR>

set rtp+=/usr/local/opt/fzf

"indentation rules
autocmd FileType markdown setl shiftwidth=4 tabstop=4

"Vim Find Definition Plugin
let $FZF_DEFAULT_COMMAND='rg --files --hidden'
nnoremap <Leader>d :FindDefinition<CR> " Normal mode
vnoremap <Leader>d "ay:FindDefinition <C-R>a<CR> " Visual mode

"autocomplete sources
set complete-=i

"coc.nvim
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"ALE
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1

"json.erb
autocmd BufNewFile,BufRead *.json.erb set syntax=ruby
