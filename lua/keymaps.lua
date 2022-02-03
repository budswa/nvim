local M = {}

local wk = require('which-key')
local map = vim.keymap.set

local function telescope(provider)
	return '<cmd>Telescope ' .. provider .. '<cr>'
end

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

M.lsp_on_attach = function(bufnr)
	local on_attach_opts = { buffer = bufnr, silent = true, noremap = true }

	map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', on_attach_opts)
	map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', on_attach_opts)
	map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', on_attach_opts)
	map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', on_attach_opts)
	map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', on_attach_opts)
	map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', on_attach_opts)
	map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', on_attach_opts)
	map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', on_attach_opts)
	map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', on_attach_opts)

	wk.register({
		['<leader>'] = {
			l = {
				name = '[LSP]',
				d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
				D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
				i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Show implementation' },
				r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename symbol' },
				R = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Show references' },
				t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Show type definition' },
				a = { '<cmd>CodeActionMenu<CR>', 'Code action' },
				A = { telescope('lsp_range_code_actions'), 'Range code action' },
				s = { telescope('lsp_workspace_symbols'), 'Workspace symbols' },
				S = { telescope('lsp_document_symbols'), 'Document symbols' },
				w = {
					name = '[Workspace]',
					l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'Workspace list' },
					a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Workspace add' },
					r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Workspace remove' },
				},
			},
			d = {
				name = '[Diagnostics]',
				q = { '<cmd>lua vim.diagnostic.setqflist()<CR>', 'Diagnostics Quickfix list' },
				l = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Diagnostics Location list' },
				f = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostics open float' },
				n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Diagnostics next' },
				p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Diagnostics previous' },
			},
		},
	})
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

wk.register({
	['<leader>'] = {
		E = { ':NvimTreeToggle<cr>', 'Toggle NvimTree' },
		f = {
			name = '[Telescope]',
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
			name = '[Trouble]',
			t = { '<cmd>TroubleToggle<cr>', 'Toggle' },
			w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Toggle workspace' },
		},
		s = {
			name = '[Session]',
			s = { '<cmd>SaveSession<cr>', 'Save' },
			c = { '<cmd>LoadLastSession<cr>', 'Last' },
			l = { '<cmd>LoadCurrentDirSession<cr>', 'Current' },
		},
		g = {
			name = '[Git]',
		},
		['<A-h>'] = { '<C-w>h', 'Window left' },
		['<A-j>'] = { '<C-w>j', 'Widnow down' },
		['<A-k>'] = { '<C-w>k', 'Window up' },
		['<A-l>'] = { '<C-w>l', 'Window right' },
	},
}, { mode = 'n' })

return M
