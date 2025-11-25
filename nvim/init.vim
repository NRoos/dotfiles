:set list
:set shiftwidth=4
:set tabstop=4
:set expandtab
:set splitbelow
:set splitright
:set equalalways noea
:set number
:set encoding=utf-8
:set path=$PWD/**


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

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


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
Plug 'pangloss/vim-javascript'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'hashivim/vim-terraform'
Plug 'shaunsingh/nord.nvim'
Plug 'tveskag/nvim-blame-line'
Plug 'junegunn/goyo.vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tveskag/nvim-blame-line'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'v0.1.9' }
Plug 'github/copilot.vim'

Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }


call plug#end()

let g:sexp_enable_insert_mode_mappings = 0
let g:deoplete#enable_at_startup = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_sign_column_always = 1

let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1

:colorscheme nordic

autocmd BufEnter * EnableBlameLine
