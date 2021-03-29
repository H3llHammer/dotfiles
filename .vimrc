" Settings {{{
"Switch syntax highlighting on, when the terminal has colors
 syntax on

 " Highlight matches
 set hlsearch

" Use vim, not vi api
 set nocompatible

 set nobackup
 set nowritebackup
 set noswapfile

" Command history
 set history=100

" Alway show cursor
 set ruler

" Show incomplete commands
 set showcmd

" Incremental searching (search as you type
 set incsearch

" Highlight search matches
 set hlsearch

" Ignore case in search
 set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
 set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not
" currently loaded in a window
" " if you try and quit Vim while there are hidden buffers, you will raise an
" error:
" " E162: No write since last change for buffer “a.txt”
 set hidden

" Turn word wrap off
 set nowrap
"
" Allow backspace to delete end of line, indent and start of line characters
 set backspace=indent,eol,start

" Convert tabs to spaces
 set expandtab

" Set tab size in spaces (this is for manual indenting)
 set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
 set shiftwidth=4

" Turn on line numbers
 set number

 " Highlight tailing whitespace
 " " See issue: https://github.com/Integralist/ProVim/issues/4
  set list listchars=tab:\ \ ,trail:·

 " Get rid of the delay when pressing O (for example)
 " http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
  set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
 set laststatus=2

" Set the status line to something useful
 set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
"
" Hide the toolbar
 set guioptions-=T

" UTF encoding
 set encoding=utf-8

" Autoload files that have changed outside of vim
 set autoread

" Use system clipboard
 set clipboard+=unnamed

 " Don't show intro
 set shortmess+=I

" Better splits (new windows appear below and to the right)
 set splitbelow
 set splitright

" Highlight the current line
 set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
 set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
" set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
 set lazyredraw

" Highlight a matching [{()}] when cursor is placed on start/end character
 set showmatch

 let mapleader = " "
 nnoremap <SPACE> <Nop>

" }}}
" Plugins {{{
 call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'bkad/CamelCaseMotion'
  Plug 'mattn/emmet-vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-syntastic/syntastic'
  Plug 'sheerun/vim-polyglot'
 call plug#end()

" Theme
 set background=dark
 colorscheme gruvbox

 let g:airline_theme='dark'

" Syntastic
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0

 let g:syntastic_checkers_javascript = ["standard"]
 let g:syntastic_javascript_standard_exec = "happiness"
 let g:syntastic_javascript_standard_generic = 1

 let g:syntastic_aggregate_errors = 1

 let g:coc_disable_startup_warning = 1

" Ack (uses Ag behind the scenes)
 let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
 let g:airline_powerline_fonts = 1

" " Gist authorisation settings
 let g:github_user = $GITHUB_USER
 let g:github_token = $GITHUB_TOKEN
 let g:gist_detect_filetype = 1
 let g:gist_open_browser_after_post = 1
" " Related plugins:
" " https://github.com/mattn/webapi-vim
" " https://github.com/vim-scripts/Gist.vim
" " https://github.com/tpope/vim-fugitive

" HTML generation using 'emmet-vim'
" " NORMAL mode Ctrl+y then , <C-y,>

" highlight clear SignColumn

" NERDTree Ignore
 let g:NERDTreeIgnore = ['^node_modules$']

" Searching the file system
 map <leader>nt :NERDTreeToggle<cr>
 map <Leader>nf :NERDTreeFind<CR>
 let NERDTreeMinimalUI=1
 let NERDTreeShowHidden=1
 let NERDTreeAutoDeleteBuffer=1

" Camel Case Motion (for dealing with programming code)
 map <silent> w <Plug>CamelCaseMotion_w
 map <silent> b <Plug>CamelCaseMotion_b
 map <silent> e <Plug>CamelCaseMotion_e
 sunmap w
 sunmap b
 sunmap e

" prettier command for coc
 command! -nargs=0 Prettier :CocCommand prettier.formatFile

 let g:coc_global_extensions = [
   \ 'coc-snippets',
   \ 'coc-pairs',
   \ 'coc-tsserver',
   \ 'coc-eslint',
   \ 'coc-prettier',
   \ 'coc-json',
   \ ]

" Rainbow brackets for vim
 let g:rainbow_active = 1
" }}}
" Mappings {{{

" Clear search buffer
 :nnoremap § :nohlsearch<cr>

" Command to use sudo when needed
 cmap w!! w !sudo tee > /dev/null %

" File System Explorer (in horizontal split)
  map <leader>. :Sexplore<cr>

" Buffers
  map <leader>yt :ls<cr>

" Buffers (runs the delete buffer command on all open buffers)
 map <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
" Decrement height
 map <leader>w- <C-W>- 
" Increment height
 map <leader>w+ <C-W>+ 
" Maximize height
 map <leader>w] <C-W>_ 
" Equalize all windows
 map <leader>w[ <C-W>= 

" Handling horizontal Vim windows doesn't appear to be possible.
" Attempting to map <C-W> < and > didn't work
" Same with mapping <C-W>|
" Make splitting Vim windows easier
 map <leader>% <C-W>s
 map <leader>" <C-W>v

" Exit
 map <Leader>q :q<CR> 
 " Save
 map <Leader>w :w<CR>

" Jump next Buffer
 map <Leader>n :bn<CR>
" Jump previous Buffer
 map <Leader>p :bp<CR>

" }}}
" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" NERDTree Config
" Start NERDTree when Vim is started without file arguments.
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd'.argv()[0] | endif"
" Exit Vim if NERDTree is the only window left.
 autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
       \ quit | endif"
" Open the existing NERDTree on each new tab.
 autocmd BufWinEnter * silent NERDTreeMirror
" End NERDTree

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd BufWinLeave * call clearmatches()

" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}

