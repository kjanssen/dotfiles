" File: .vimrc
" Author: Kyle Janssen
" Contents: My .vimrc cobbled together from other people's versions.

"------------------------------------------------------------
" VUNDLE BUNDLES
"------------------------------------------------------------

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'kien/ctrlp.vim'
" Bundle 'scrooloose/syntastic'
" Bundle 'lukaszb/vim-web-indent'
Bundle 'wting/rust.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'toyamarinyon/vim-swift'
Bundle 'bling/vim-airline'

" Configure airline
let g:airline_powerline_fonts = 1
set noshowmode

" colorschemes
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'altercation/vim-colors-solarized'

"------------------------------------------------------------
" SETTINGS
"------------------------------------------------------------

" Enable file type detection
filetype indent plugin on
" Enable syntax highlighting
syntax on
" hidden option allows you to re-use the same window and switch from an unsaved buffer without saving it first. set hidden
set hidden
" Better command-line completion
set wildmenu
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" Show partial commands in the last line of the screen
set showcmd
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" incremental search
set incsearch
" line numbers on
set number

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using 4 spaces instead of tabs.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshowmode

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" highlight current line
set cursorline

" remember more commands and search history
set history=10000

"set colorscheme
set t_Co=256
set background=dark
color solarized

" no word wrapping
set nowrap

" Show invisible chars (EOL / tabs
set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" More natural split opening
set splitbelow
set splitright

"------------------------------------------------------------
" MAPPINGS
"------------------------------------------------------------

" Automatically close curly brace blocks
inoremap {<CR>  {<CR><BS>}<Esc>O

" Make Enter insert a blank line without going into insert mode.
nnoremap <CR> o<Esc>

" Make H and L jump to beginning and end of line content
noremap H ^
noremap L $

imap lkj

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
" AUTOCOMMANDS
"------------------------------------------------------------

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " reload vimrc on write
  augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup END " }
endif

