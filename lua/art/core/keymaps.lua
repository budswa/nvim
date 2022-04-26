local map = vim.keymap.set

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

-- Navigate between windows
map('n', '<A-H>', ':wincmd h<cr>', { silent = true })
map('n', '<A-J>', ':wincmd j<cr>', { silent = true })
map('n', '<A-K>', ':wincmd k<cr>', { silent = true })
map('n', '<A-L>', ':wincmd l<cr>', { silent = true })

map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

map('n', 'J', 'mzJ`z', { noremap = true })

map('x', '<', '<gv', { noremap = true })
map('x', '>', '>gv', { noremap = true })

map('v', '<c-p>', '"_dP', { noremap = true })

-- Reverse join-line
map('n', 'gJ', 'i<cr><esc>J', { noremap = true })

-- Remove selection hl after search
map('n', '<esc>', ':noh<cr>', opts)

-- Close terminal
map('t', '<esc>', '<c-\\><c-n>', {})
