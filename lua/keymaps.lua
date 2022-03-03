local M = {}

local wk = require('which-key')
local map = vim.keymap.set

local function telescope(provider)
	return '<cmd>Telescope ' .. provider .. '<cr>'
end

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

M.lsp = function(bufnr)
	local lsp_opts = { buffer = bufnr, silent = true, noremap = true }

    --map('n', 'g0', vim.lsp.buf.document_symbol(), lsp_opts)
	--map('n', 'K', vim.lsp.buf.hover(), lsp_opts)
	--map('n', '<c-k>', vim.lsp.buf.signature_help(), lsp_opts)
	--map('n', 'gr', vim.lsp.buf.references(), lsp_opts)
	--map('n', 'gi', vim.lsp.buf.implementation(), lsp_opts)
	--map('n', 'gD', vim.lsp.buf.declaration(), lsp_opts)
	--map('n', 'gd', vim.lsp.buf.definition(), lsp_opts)
	--map('n', 'gr', vim.lsp.buf.references(), lsp_opts)

	wk.register({
		['<leader>'] = {
			l = {
				name = '[LSP]',
				d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition' },
				D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
				i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Show implementation' },
				r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol' },
				R = { '<cmd>lua vim.lsp.buf.references()<cr>', 'Show references' },
				t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Show type definition' },
				f = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Diagnostics open float' },
				a = { '<cmd>CodeActionMenu<cr>', 'Code action' },
				A = { telescope('lsp_range_code_actions'), 'Range code action' },
				s = { telescope('lsp_workspace_symbols'), 'Workspace symbols' },
				S = { telescope('lsp_document_symbols'), 'Document symbols' },
				w = {
					name = '[Workspace]',
					l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'Workspace list' },
					a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Workspace add' },
					r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Workspace remove' },
				},
			},
		},
	})
end

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
map('n', 'gJ', 'i<cr><Esc>J', { noremap = true })

-- Remove selection hl after search
map('n', '<Esc>', ':noh<cr>', opts)

-- Leave terminal
map('t', '<Esc>', '<c-\\><c-n>', {})

-- move
--map('n', '<A-j>', require('move').MoveLine(1), opts)*/
--map('n', '<A-k>', require('move').MoveLine(-1), opts)*/
--map('v', '<A-j>', require('move').MoveBlock(1), opts)*/
--map('v', '<A-k>', require('move').MoveBlock(-1), opts)*/
--map('n', '<A-l>', require('move').MoveHChar(1), opts)*/
--map('n', '<A-h>', require('move').MoveHChar(-1), opts)*/
--map('v', '<A-l>', require('move').MoveHBlock(1), opts)*/

wk.register({
	['<leader>'] = {
		E = { '<cmd>NvimTreeToggle<cr>', 'Toggle NvimTree' },
		U = { '<cmd>UndotreeToggle<cr>', 'Toggle UndoTree' },
		[':'] = { telescope('commands'), 'Commands' },
		f = {
			name = '[Find]',
			f = { telescope('find_files'), 'Files' },
			g = { telescope('live_grep'), 'Grep' },
			r = { telescope('frecency'), 'Frecency' },
			k = { telescope('keymaps'), 'Maps' },
			m = { telescope('marks'), 'Marks' },
			b = { telescope('buffers'), 'Buffers' },
			n = { '<cmd>lua require("telescope").extensions.notify.notify()', 'Notifications' },
			y = { '<cmd>lua require("telescope").extensions.neoclip.default()<cr>', 'Clipboard manager' },
			[':'] = { telescope('command_history'), 'Command history' },
			['/'] = { telescope('search_history'), 'Search history' },
		},
		t = {
			name = '[Trouble]',
			t = { '<cmd>TroubleToggle<cr>', 'Document' },
			T = { '<cmd>TodoTrouble<cr>', 'Todo' },
			w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
		},
		h = {
			name = '[Help]',
			t = { telescope('builtins'), 'Telescope' },
			h = { telescope('help_tags'), 'Help tags' },
			m = { telescope('man_pages'), 'Man pages' },
			k = { telescope('keymaps'), 'Keymaps' },
			o = { telescope('vim_options'), 'Options' },
		},
		H = {
			name = '[Harpoon]',
			a = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", 'Add file' },
			m = { "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", 'Menu' },
			n = { "<cmd>lua require'harpoon.ui'.nav_next()", 'Next file' },
			p = { "<cmd>lua require'harpoon.ui'.nav_prev()<cr>", 'Previous file' },
			t = { '<cmd>Telescope harpoon marks<cr>', 'Telescope' },
		},
		s = {
			name = '[Session]',
			s = { '<cmd>SaveSession<cr>', 'Save' },
			c = { '<cmd>LoadLastSession<cr>', 'Last' },
			l = { '<cmd>LoadCurrentDirSession<cr>', 'Current' },
		},
		g = {
			name = '[Git]',
			y = { 'Gitlinker' },
			b = { '<cmd>Gitsigns toggle_current_line_blame<cr>', 'Toggle line blame' },
			h = {
				name = '[Hunk]',
				s = { '<cmd>Gitsings stage_hunk<cr>', 'Stage' },
				u = { '<cmd>Gitsings undo_stage_hunk<cr>', 'Undo stage' },
				r = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk' },
				R = { '<cmd>Gitsigns reset_buffer<cr>', 'Reset buffer' },
				P = { '<cmd>Gitsigns preiew_hunk<cr>', 'Preview hunk' },
				p = { '<cmd>Gitsigns prev_hunk<cr>', 'Previous hunk' },
				n = { '<cmd>Gitsigns next_hunk<cr>', 'Next hunk' },
			},
		},
		w = {
			name = '[Window]',
			c = { '<c-w>c', 'Close window' },
			h = { '<c-w>h', 'Left' },
			j = { '<c-w>j', 'Down' },
			k = { '<c-w>k', 'Up' },
			l = { '<c-w>l', 'Right' },
			H = { '<c-w>5<', 'Resize left' },
			J = { '<cmd>resize +5<cr>', 'Resize down' },
			K = { '<cmd>resize -5<cr>', 'Resize up' },
			L = { '<c-w>5>', 'Resize right' },
			x = { '<c-w>s', 'Horizontal split' },
			v = { '<c-w>v', 'Vertical split' },
			['='] = { '<c-w>=', 'Balance window' },
		},
	},
}, { mode = 'n' })

return M
