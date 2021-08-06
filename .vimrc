" Load files
source ~/.vimrc.plug	    " Call the plugins file

syntax on		    " Enable syntax highlight
set number		    " Show line numbers
set noswapfile
" set wrap linebreak nolist

set hlsearch		    " Highlight all search results
set smartcase		    " Enable smart-case search
set ignorecase		    " Always case-insensitive

set autoindent		    " Auto-indent new lines
set shiftwidth=4	    " Number of auto-indent spaces
set smartindent		    " Enable smart-indent
set smarttab		    " Enable smart-tabs
set softtabstop=4	    " Number of spaces per Tab

set laststatus=2	    " Set the status line size

autocmd BufWritePost .vimrc source %	" auto reload
