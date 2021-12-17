local M = {}

local map = vim.api.nvim_set_keymap
--local wk = require('which-key')

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

M.lsp = function(bufnr)
	local function buf_map(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	buf_map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
end

-- Navigate between windows
--map('n', '<A-j>', [[<C-w><C-j>]], opts)
--map('n', '<A-h>', [[<C-w><C-h>]], opts)
--map('n', '<A-k>', [[<C-w><C-k>]], opts)
--map('n', '<A-l>', [[<C-w><C-l>]], opts)
map('n', '<Leader>j', ':wincmd j<CR>', { silent = true })
map('n', '<Leader>k', ':wincmd k<CR>', { silent = true })
map('n', '<Leader>l', ':wincmd l<CR>', { silent = true })
map('n', '<Leader>h', ':wincmd h<CR>', { silent = true })
--vim.api.nvim_set_keymap("n", "<Leader>r", "<C-w>r<CR>", { silent = true })
map('n', '<Leader>vs', '<C-w>v', { silent = true })

map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

map('n', 'J', 'mzJ`z', { noremap = true })

-- Reverse join-line
map('n', '<C-j>', 'i<CR><Esc>J', { noremap = true })

-- Remove selection hl after search
map('n', '<Esc>', ':noh<CR>', opts)

-- Leave terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', {})

-- Go back from gf
map('n', 'gb', '<C-o>', opts)

-- luasnip
map('i', '<C-E>', '<Plug>luasnip-next-choice', {})
map('s', '<C-E>', '<Plug>luasnip-next-choice', {})

-- move
map('n', '<A-j>', [[<Cmd>lua require('move').MoveLine(1)<CR>]], opts)
map('n', '<A-k>', [[<Cmd>lua require('move').MoveLine(-1)<CR>]], opts)
map('v', '<A-j>', [[<Cmd>lua require('move').MoveBlock(1)<CR>]], opts)
map('v', '<A-k>', [[<Cmd>lua require('move').MoveBlock(-1)<CR>]], opts)
map('n', '<A-l>', [[<Cmd>lua require('move').MoveHChar(1)<CR>]], opts)
map('n', '<A-h>', [[<Cmd>lua require('move').MoveHChar(-1)<CR>]], opts)
map('v', '<A-l>', [[<Cmd>lua require('move').MoveHBlock(1)<CR>]], opts)

-- Toggleterm
vim.api.nvim_set_keymap(
	'n',
	'<Leader>sf',
	":lua require('toggleterm.terminal').Terminal:new { direction = 'float', count = 1 }:toggle()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<Leader>sr',
	":lua require('toggleterm.terminal').Terminal:new { direction = 'vertical', count = 2 }:toggle()<CR>",
	{ noremap = true, silent = true }
)

return M
