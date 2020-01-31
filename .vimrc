call plug#begin()
Plug 'preservim/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'stephpy/vim-yaml'
Plug 'vim-ruby/vim-ruby'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'ngmy/vim-rubocop'
Plug 'zivyangll/git-blame.vim'
call plug#end()

"Prettier Config
let g:prettier#autoformat = 0
autocmd BufWritePre *.rb,*.yaml,*.js Prettier

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
"set guifont=Hack\ Nerd\ Font:h14
filetype plugin indent on

"On Save
autocmd BufWritePre * :%s/\s\+$//e

map <C-n> :NERDTreeToggle<CR>

set rtp+=/usr/local/opt/fzf

