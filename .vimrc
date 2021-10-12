" Load external files
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug    " Call the plugins file
endif

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

colorscheme industry

"" Variables
" Map leader
let mapleader = " "				" Set space as map leader
" Disable matching parenthesis highlighting
let g:loaded_matchparen=1
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
" Rainbow
let g:rainbow_active = 1                        " Enable rainbow parentheses
" CoC
let g:coc_global_extensions = ['coc-json', 
	    \ 'coc-tailwindcss',	
	    \ 'coc-snippets', 
	    \ 'coc-prettier', 
	    \ 'coc-html-css-support', 
	    \ 'coc-html',
	    \ 'coc-eslint', 
	    \ 'coc-tsserver', 
	    \ 'coc-sql', 
	    \ 'coc-sh',
	    \ 'coc-react-refactor', 
	    \ 'coc-python', 
	    \ 'coc-pyright', 
	    \ 'coc-phpls', 
	    \ 'coc-java', 
	    \ 'coc-css', ]
" CoC suggestion box
hi Pmenu ctermbg=black ctermfg=white
" Visual mode color
"hi Visual cterm=NONE ctermbg=black ctermfg=NONE guibg=Grey40
hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan

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
" CoC
    " Go to code navigation 
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

"" Commands
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" CoC
" Tab trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
" Use enter to select the completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
