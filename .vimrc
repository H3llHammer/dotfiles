source ~/.vimrc.plug	    " Call the plugins file

syntax on		    " Enable syntax highlight
set encoding=utf-8	    " UTF-8 encoding enabled
set number		    " Show line numbers
set noswapfile		    " Disabling swap files creation
set nobackup		    " Disabling backup files
set hidden		    " 
set autoread		    " Autoread file
" set wrap linebreak nolist

set undofile
set undodir=~/.vim/undodir

set hlsearch		    " Highlight all search results
set smartcase		    " Enable smart-case search
set ignorecase		    " Always case-insensitive

set autoindent		    " Auto-indent new lines
set shiftwidth=4	    " Number of auto-indent spaces
set smartindent		    " Enable smart-indent
set smarttab		    " Enable smart-tabs
set softtabstop=4	    " Number of spaces per Tab

" Status line config
set laststatus=0	    " Set the status line size
set noshowmode		    " Don't show the show mode
set noruler		    " Don't show current row and column
set shortmess+=F	    " 
set noshowcmd		    " Don't show command status

" Variables
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

" Key Bindings
" Buffers
map <S-Tab> :bn<CR>
