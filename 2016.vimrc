call pathogen#infect()
set nocompatible              " be iMproved, required
set backspace=2
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'keith/rspec.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'mkitt/tabline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'w0ng/vim-hybrid'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'tommcdo/vim-fugitive-blame-ext'
Plugin 'Tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'othree/html5.vim'
Plugin 'chrisbra/csv.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" Put your non-Plugin stuff after this line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
syntax on
set number
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let mapleader = ","
set mouse=a
set shiftwidth=2
"
set incsearch
set hlsearch
" remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
" CROSSHAIR
set cursorcolumn
set cursorline
set re=1
" disables crosshare in inactive window
augroup CursorLine
 au!
 au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
 au WinLeave * setlocal nocursorline nocursorcolumn
augroup END
set tabstop=2
set expandtab
set noswapfile
" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set ignorecase
set scrolloff=10
" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
set clipboard=unnamed
set laststatus=2
nmap <leader>w :w!<cr>
nmap <leader>t :TrailerTrim<cr>
nmap <silent> <leader>dd <Plug>DashSearch
noremap <leader>g :Ag<space>
hi MatchParen cterm=none ctermbg=green ctermfg=black
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
set background=dark
" HYBRID THEME
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
let g:hybrid_use_Xresources = 1
"Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
 " Use Ag over Grep
 set grepprg=ag\ --nogroup\ --nocolor
 " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
