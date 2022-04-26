local wk = require('which-key')

local border = {
	{ '╭', 'FloatBorder' },
	{ '─', 'FloatBorder' },
	{ '╮', 'FloatBorder' },
	{ '│', 'FloatBorder' },
	{ '╯', 'FloatBorder' },
	{ '─', 'FloatBorder' },
	{ '╰', 'FloatBorder' },
	{ '│', 'FloatBorder' },
}

require('which-key').setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	operators = { gc = 'Comments' },
	key_labels = {
		['<space>'] = 'SPC',
		['<cr>'] = 'RET',
		['<tab>'] = 'TAB',
	},
	icons = {
		breadcrumb = '+',
		separator = '▏',
		group = '',
	},
	popup_mappings = {
		scroll_down = '<c-d>',
		scroll_up = '<c-u>',
	},
	window = {
		border = border,
		position = 'bottom',
		margin = { 0, 0, 1, 0 },
		padding = { 1, 1, 1, 1 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 24 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = 'left',
	},
	hidden = { '<silent>', '<cmd>', '<cr>', 'call', 'lua', '^:', '^ ' },
	show_help = true,
	triggers = 'auto',
	triggers_blacklist = {
		i = { 'j', 'k' },
		v = { 'j', 'k' },
	},
})

local function telescope(provider)
	return '<cmd>Telescope ' .. provider .. '<cr>'
end

wk.register({
	['<leader>'] = {
		E = { '<cmd>Neotree<cr>', 'Toggle Neotree' },
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
		T = {
			name = '[Trouble]',
			d = { '<cmd>TroubleToggle<cr>', 'Document' },
			w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
			t = { '<cmd>TodoTrouble<cr>', 'Todo' },
		},
		h = {
			name = '[Help]',
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
local wk = require('which-key')

local border = {
	{ '╭', 'FloatBorder' },
	{ '─', 'FloatBorder' },
	{ '╮', 'FloatBorder' },
	{ '│', 'FloatBorder' },
	{ '╯', 'FloatBorder' },
	{ '─', 'FloatBorder' },
	{ '╰', 'FloatBorder' },
	{ '│', 'FloatBorder' },
}

require('which-key').setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	operators = { gc = 'Comments' },
	key_labels = {
		['<space>'] = 'SPC',
		['<cr>'] = 'RET',
		['<tab>'] = 'TAB',
	},
	icons = {
		breadcrumb = '+',
		separator = '▏',
		group = '',
	},
	popup_mappings = {
		scroll_down = '<C-d>',
		scroll_up = '<C-u>',
	},
	window = {
		border = border,
		position = 'bottom',
		margin = { 0, 0, 1, 0 },
		padding = { 1, 1, 1, 1 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 24 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = 'left',
	},
	hidden = { '<silent>', '<cmd>', '<cr>', 'call', 'lua', '^:', '^ ' },
	show_help = true,
	triggers = 'auto',
	triggers_blacklist = {
		i = { 'j', 'k' },
		v = { 'j', 'k' },
	},
})

vim.api.nvim_create_augroup('whichkey', {})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'which_key',
	group = 'whichkey',
	callback = function()
		local hl = vim.api.nvim_get_hl_by_name('WhichKeyFloat', true).background
		local hl_prev = vim.api.nvim_get_hl_by_name('MsgArea', true).background
		vim.api.nvim_set_hl(0, 'MsgArea', { bg = hl })
		vim.o.laststatus = 0
		vim.api.nvim_create_autocmd('BufLeave', {
			pattern = '*',
			nested = true,
			once = true,
			group = 'whichkey',
			callback = function()
				vim.api.nvim_set_hl(0, 'MsgArea', { bg = hl_prev })
				vim.o.laststatus = 3
			end,
		})
	end,
})

local function telescope(provider)
	return '<cmd>Telescope ' .. provider .. '<cr>'
end

wk.register({
	['<leader>'] = {
		E = { '<cmd>Neotree<cr>', 'Toggle Neotree' },
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
		T = {
			name = '[Trouble]',
			d = { '<cmd>TroubleToggle<cr>', 'Document' },
			w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace' },
			t = { '<cmd>TodoTrouble<cr>', 'Todo' },
		},
		h = {
			name = '[Help]',
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
