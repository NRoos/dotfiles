:set list
:set shiftwidth=2
:set tabstop=2
:set expandtab
:set splitbelow
:set splitright
:set equalalways noea
:set number
:set encoding=utf-8
:set path=$PWD/**

:colorscheme pablo

:let g:netrw_banner=0
:let g:netrw_liststyle=3

:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-S-E> :Explore<CR>
:tnoremap <Esc> <C-\><C-n>
:inoremap <silent> <expr> <Tab> utils#tabComplete()
:xnoremap ç :'<.'>w !pbcopy<CR><CR>
:nnoremap <C-W><C-G> :Goyo<CR>

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.neovim/plugged')
Plug 'luochen1990/rainbow'
Plug 'pangloss/vim-javascript'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'
Plug 'tveskag/nvim-blame-line'
Plug 'junegunn/goyo.vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'


Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'guns/vim-slamhound', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'tpope/vim-salve', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}

call plug#end()

let g:sexp_enable_insert_mode_mappings = 0
let g:deoplete#enable_at_startup = 1

let g:rainbow_active = 1

let g:rainbow_conf = { 'ctermfgs': ['blue', 'red', 'cyan', 'magenta'] }

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_sign_column_always = 1

" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


autocmd BufEnter * EnableBlameLine
