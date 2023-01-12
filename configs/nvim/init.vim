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
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'v0.3.0' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'ahmedkhalf/project.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
colorscheme catppuccin-macchiato
lua require('crates').setup()
lua require('gitsigns').setup()

set completeopt=menu,menuone,noselect
