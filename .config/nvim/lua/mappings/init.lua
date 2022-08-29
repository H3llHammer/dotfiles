local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

local opts = { noremap = true, silent = true }

-- Map <leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', ':update<CR>')
map('n', '<leader>W', ':wall<CR>')

-- Move to the next/previous buffer
map('n', '<S-Tab>', ':bn<CR>')
map('n', '<A-Tab>', ':bp<CR>')
map('n', '<leader>d', ':bd<CR>')
map('n', '<leader>l', ':ls<CR>')

-- Quit neovim
map('n', '<leader>q', ':q<CR>')

map('n', "<leader><Tab>", ':b#<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', ':vsplit<CR>')
map('n', '<A-\\>', ':split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', ':move .+1<CR>')
map('n', '<C-k>', ':move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
