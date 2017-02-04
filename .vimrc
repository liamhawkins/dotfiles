set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required


Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'Yggdroot/indentLine'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set shell=/bin/bash

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

set encoding=utf-8

let python_highlight_all=1
syntax on

set t_Co=256
colorscheme neodark
hi Normal ctermbg=NONE

set rnu
set number

set laststatus=2

set ts=4
set autoindent
set expandtab
set cursorline
set showmatch

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" F2 Toggles Paste Mode
set pastetoggle=<F2>

" Vim remembers where you left off
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Start NERDTree automatically when vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle NERDTree with hotkey CTRL+n
map <C-n> :NERDTreeToggle<CR>

" Show hidden files by default
let NERDTreeShowHidden=1

" Close NERDTree after opening a file
let NERDTreeQuitOnOpen = 1

" Close vim if only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Source .vimrc file when saving
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif


set ttimeoutlen=50

let mapleader = ","
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>
