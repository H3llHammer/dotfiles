" Load external files
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug    " Call the plugins file
endif

syntax on		    " Enable syntax highlight
set encoding=utf-8	    " UTF-8 encoding enabled
set number		    " Show line numbers
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
" Airline
let g:airline_powerline_fonts = 1		" Enabled powerline symbols
let g:airline#extensions#tabline#enabled = 1	" Display a tab line at the top containing the name of all open buffers
let g:airline_theme='angr'	" Set the airline theme
" FZF
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
" Floaterm
let g:floaterm_keymap_toggle = '<F12>'		" Open/Close floating terminal
let g:floaterm_keymap_kill = '<F2>'		" Kill current floating terminal

"" Key Bindings
" Save and exit
    " Close the current buffer
    map <leader>q :q<CR>	    
    " Save the current buffer
    map <leader>w :w<CR>
    " Close without save
    map <leader>! :q!<CR>
" Buffers
    " Switch between buffers 
    map <S-Tab> :bn<CR>
    " Switch to next buffer
    map <leader>bn :bn<CR>
    " Switch to previous buffer
    map <leader>bp :bp<CR>
    " Remove current buffer
    map <leader>bd :bd<CR>
" NERDTree
    " Find the file for the active buffer in the NERDTree window
    map <leader>f :NERDTreeFind<CR>
    " Open or close NERDTree depending on the case
    nnoremap <C-t> :NERDTreeToggle<CR>
" GitGutter
    " On/Off GitGutter
    map <leader>go :GitGutterToggle<CR>

"" Commands
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

