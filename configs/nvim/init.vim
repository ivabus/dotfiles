filetype plugin indent on
set showmatch
set hlsearch
set incsearch
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
set wildmode=longest, list
set cc=80
syntax on
set noswapfile
set backupdir=~/.cache/vim
set completeopt=noinsert,menuone,noselect
set cursorline
set relativenumber

call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

colorscheme catppuccin-macchiato

autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

