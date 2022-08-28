local g = vim.g
local set = vim.o

set.termguicolors = true
set.hidden = true -- Don't unload buffer when it is abandoned

set.number = true -- Print the line number in front of each line
set.numberwidth = 4 -- Number of colums used for the linux number
set.relativenumber = true -- Show relative line number in front of each linux
set.cursorline = true -- Highlight the screen line of the cursor

set.expandtab = true -- Use spaces when <Tab> is inserted
set.smarttab = true -- Use 'shiftwidth' when inserting <Tab>

set.shiftwidth = 4 -- Number of spaces to user for (auto)indent step
set.tabstop = 4 -- Number of spaces that <Tab> in file uses

set.hlsearch = true -- Highlight matches with last search pattern
set.incsearch = true --Hightligh match while typing search patter

set.splitbelow = true -- New window from split is below the current one
set.splitright = true -- New window is put right of the current one

set.scrolloff = 5 -- Minimum nr. of lines above an below cursor

set.fileencoding = 'utf-8' -- File encodings for multibyte text

set.wrap = false -- Long lines and continue on then next line
set.textwidth = 300 -- Maximum width of text that is being inserted
set.list = true -- Show <Tab> and <EOL>

set.backup = false -- Keep backup file after overwriting a file
set.writebackup = false -- Make a backup before overwriting a file
set.undofile = true -- Save undo information in a file
set.swapfile = false -- Whether to use a swapfile for a buffer

set.clipboard = 'unnamedplus' -- Makes neovim and host OS clipboard play nicely with each other

set.history = 50 -- Number of command-lines that are remembered
