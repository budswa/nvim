local whichkey = require('whichkey_setup')

vim.g.hide_statusline = true

vim.g.which_key_max_size = 0
vim.g.which_key_use_floating_win = 0

vim.g.which_key_timeout = 300
vim.g.which_key_ignore_invalid_key = 1

vim.g.which_key_sort_horizontal = 1
vim.g.which_key_centered = 0
vim.g.which_key_sep = '>'
vim.g.which_key_hspace = 3
vim.g.which_key_flatten = 1

local keymap = {
	a = {
		name = '+action',
		s = {'<cmd>'},
	},
  f = {
    name = "+find",
		l = {
			name = '+LSP',
			d = {'<cmd>Telescope lsp_definitions<CR>', 'definitions'},
			w = {'<cmd>Telescope lsp_workspace_diagnostics<CR>', 'workspace diagnostics'},
			D = {'<cmd>Telescope lsp_document_diagnostics<CR>', 'document diagnostics'},
		},
    g = {
      name = "+git",
			s = {'<cmd>Telescope git_status<CR>', 'status'},
			f = {'<cmd>Telescope git_files<CR>', 'files'},
			c = {'<cmd>Telescope git_commits<CR>', 'commits'},
			C = {'<cmd>Telescope git_bcommits<CR>', 'buffer commits'},
			b = {'<cmd>Telescope git_branches<CR>', 'branches'},
    },
		f = {'<cmd>Telescope find_files<CR>', 'files'},
		w = {'<cmd>Telescope live_grep<CR>', 'grep'},
  },
	s = {
		name = '+session',
		s = {'<cmd>SessionSave<CR>', 'save'},
		l = {'<cmd>SessionLoad<CR>', 'load'},
	},
	g = {
	  name = "+git",
		-- y = {'<cmd>lua require"gitlinker".get_buf_range_url('n')<CR>', 'gitlink'}
	},
	U = {'<cmd>UndotreeToggle<CR>', 'Undotree'},
	E = {'<cmd>NvimTreeToggle<CR>', 'NvimTree'},
}

whichkey.register_keymap('leader', keymap)
