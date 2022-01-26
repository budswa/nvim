local M = {}

local wk = require('which-key')
local map = vim.keymap.set

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

M.lsp_on_attach = function(bufnr)
	map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map(
		'n',
		'<leader>wa',
		'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map(
		'n',
		'<leader>wr',
		'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map(
		'n',
		'<leader>wl',
		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map(
		'n',
		'<leader>D',
		'<cmd>lua vim.lsp.buf.type_definition()<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map(
		'v',
		'<leader>ca',
		'<cmd>lua vim.lsp.buf.range_code_action()<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map(
		'n',
		'<leader>e',
		'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { buffer = bufnr, silent = true, noremap = true })
	map(
		'n',
		'<leader>q',
		'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
		{ buffer = bufnr, silent = true, noremap = true }
	)
	map(
		'n',
		'<leader>so',
		[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
		{ buffer = bufnr, silent = true, noremap = true }
	)
end

-- Navigate between windows
--map('n', '<Leader>j', ':wincmd j<CR>', { silent = true })
--map('n', '<Leader>k', ':wincmd k<CR>', { silent = true })
--map('n', '<Leader>l', ':wincmd l<CR>', { silent = true })
--map('n', '<Leader>h', ':wincmd h<CR>', { silent = true })
--map('n', '<Leader>r', '<C-w>r<CR>', { silent = true })
--map('n', '<Leader>vs', '<C-w>v', { silent = true })

map('n', 'n', 'nzzzv', {})
map('n', 'N', 'Nzzzv', {})

map('n', 'J', 'mzJ`z', { noremap = true })

-- Reverse join-line
map('n', 'gJ', 'i<CR><Esc>J', { noremap = true })

-- Remove selection hl after search
map('n', '<Esc>', ':noh<CR>', opts)

-- Leave terminal
map('t', '<Esc>', '<C-\\><C-n>', {})

-- Go back from gf
map('n', 'gb', '<C-o>', opts)

-- -- move
map('n', '<A-j>', [[<cmd>lua require('move').MoveLine(1)<CR>]], opts)
map('n', '<A-k>', [[<cmd>lua require('move').MoveLine(-1)<CR>]], opts)
map('v', '<A-j>', [[<cmd>lua require('move').MoveBlock(1)<CR>]], opts)
map('v', '<A-k>', [[<cmd>lua require('move').MoveBlock(-1)<CR>]], opts)
map('n', '<A-l>', [[<cmd>lua require('move').MoveHChar(1)<CR>]], opts)
map('n', '<A-h>', [[<cmd>lua require('move').MoveHChar(-1)<CR>]], opts)
map('v', '<A-l>', [[<cmd>lua require('move').MoveHBlock(1)<CR>]], opts)

map({ 'i', 's' }, '<C-E>', '<Plug>luasnip-next-choice', {})
map({ 'i', 's' }, '<C-K>', '<Plug>luasnip-expand-or-jump', {})

local function telescope(provider)
	return ':Telescope ' .. provider .. '<cr>'
end

wk.register({
	['<leader>'] = {
		E = { ':NvimTreeToggle<cr>', 'Toggle NvimTree' },
		f = {
			name = 'Telescope',
			f = { telescope('find_files'), 'Files' },
			g = { telescope('live_grep'), 'Grep' },
			r = { telescope('frecency'), 'Frecency' },
			k = { telescope('keymaps'), 'Maps' },
			m = { telescope('marks'), 'Marks' },
			b = { telescope('buffers'), 'Buffers' },
			[':'] = { telescope('command_history'), 'Command history' },
			['/'] = { telescope('search_history'), 'Search history' },
		},
		t = {
			name = 'Trouble',
			t = { ':TroubleToggle<cr>', 'Toggle' },
			w = { ':TroubleToggle workspace_diagnostics<cr>', 'Toggle workspace' },
		},
		s = {
			name = 'Session',
			s = { ':SaveSession<cr>', 'Save' },
			c = { ':LoadLastSession<cr>', 'Last' },
			l = { ':LoadCurrentDirSession<cr>', 'Current' },
		},
		['<A-h>'] = { '<C-w>h', 'Window left' },
		['<A-j>'] = { '<C-w>j', 'Widnow down' },
		['<A-k>'] = { '<C-w>k', 'Window up' },
		['<A-l>'] = { '<C-w>l', 'Window right' },
	},
}, { mode = 'n' })

return M
