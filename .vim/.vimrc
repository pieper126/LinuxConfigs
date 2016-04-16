set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'shougo/neocomplcache.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required
filetype on

" set leader
let mapleader = ' '

"stop swp files
set noswapfile

" indent
set autoindent
set copyindent
set smartindent

"toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" normal vim settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
inoremap jj <esc>

" airline settings
let g:airline#extensions#tabline#enabled = 1

" CtrlP settings
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
" Disable autocompletePopup
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

autocmd VimEnter * NERDTree
