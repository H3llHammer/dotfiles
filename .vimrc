syntax on		    " Enable syntax highlight
set encoding=utf-8	    " UTF-8 encoding enabled
set number		    " Show line numbers
set relativenumber
set noswapfile		    " Disabling swap files creation
set nobackup		    " Disabling backup files
set hidden		    " Don't show unsaved jobs on the screen
set autoread		    " Autoread file

" set wrap linebreak nolist

set undofile		    " Save your history and undo changes even after a reboot
set undodir=~/.vim/undodir  " Directory to save undofiles

set hlsearch		    " Highlight all search results
set smartcase		    " Enable smart-case search
set ignorecase		    " Always case-insensitive

set autoindent		    " Auto-indent new lines
set shiftwidth=4	    " Number of auto-indent spaces
set smartindent		    " Enable smart-indent
set smarttab		    " Enable smart-tabs
set softtabstop=4	    " Number of spaces per Tab

"" Status line config
set laststatus=0	    " Set the status line size
set noshowmode		    " Don't show the show mode
set noruler		    " Don't show current row and column
set shortmess+=F	    " Don't give the file info when editing a file 
set noshowcmd		    " Don't show command status

"" Variables
" Map leader
let mapleader = " "				" Set space as map leader
" Disable matching parenthesis highlighting
let g:loaded_matchparen=1

"" Key Bindings
" Save and exit
    " Close the current buffer
    map <leader>q :q<CR>	    
    " Save the current buffer
    map <leader>w :w<CR>
    " Close without save
    map <leader>! :q!<CR>
" Copy and paste with system clipboard
    inoremap <C-v> <ESC>"+pa
    vnoremap <C-c> "+y
    vnoremap <C-d> "+d
" Buffers
    " Switch between buffers 
    map <S-Tab> :bn<CR>
    map <C-S-Tab> :bn<CR>
    " Switch to next buffer
    map <leader>bn :bn<CR>
    " Switch to previous buffer
    map <leader>bp :bp<CR>
    " Remove current buffer
    map <leader>bd :bd<CR>
