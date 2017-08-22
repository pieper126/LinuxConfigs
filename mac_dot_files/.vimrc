set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

if has("nvim")
  Plugin 'Shougo/deoplete.nvim'
else
  Plugin 'shougo/neocomplete.vim'
endif
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yggdroot/indentline'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'nacitar/terminalkeys.vim'
Plugin 'w0rp/ale'

" tmux plugins
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'

Plugin 'easymotion/vim-easymotion'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'janko-m/vim-test'
call vundle#end()            " required
filetype plugin indent on    " required
filetype on

" ------------------- normal vim -----------------------------------
"handle colorscheme
set background=dark
colorscheme gruvbox
syntax enable

" stop vim from slowing down by syntax highlighting
"set nohidden
set re=1

"used for handling color 256 for the colorscheme
set t_ut=

" set leader
let mapleader = ' '

"stop swp files
set noswapfile

" indent
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
set hlsearch
set list lcs=tab:·⁖,trail:¶
set cursorline
set relativenumber
autocmd BufWritePre * %s/\s\+$//e
inoremap jj <esc>

"------------------------------ end normal vim setup -----------------

"---------- airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

"-------------------- CtrlP settings
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:neocomplcache_enable_smart_case = 1

"-------------------- The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"-------------------- end The Silver Searcher
"-------------------- end CtrlP settings

"------------------------------ Ale
nmap <silent> <Tab> <Plug>(ale_previous_wrap)
nmap <silent> <S-Tab> <Plug>(ale_next_wrap)
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\}
"------------------------------ end Ale

"----------------------- begin vim-test
let g:test#preserve_screen = 1
let test#strategy = "vimux"
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestSuite<CR>
"----------------------- end vim-test

"----------------------- begin vimux
let g:VimuxOrientation = "v"
let VimuxUseNearest = 1
"----------------------- end vimux

" tmuxline options
let g:tmuxline_preset = {
      \'a'       : '#S',
      \'b'       : '#W',
      \'c'       : '#H',
      \'win'     : '#I #W',
      \'cwin'    : '#I #W',
      \'x'       : '%a',
      \'y'       : '#W %R',
      \'z'       : '#H',
      \'options' : {'status-justify' : 'left'}}

let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '>',
      \ 'right' : '',
      \ 'right_alt' : '<',
      \ 'space' : ' '}

" Disable autocompletePopup
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

