local neorg = require('neorg')

neorg.setup({
	load = {
		['core.defaults'] = {},
		['core.ui'] = {},
		['core.neorgcmd'] = {},
		['core.norg.concealer'] = {},
		['core.integrations.treesitter '] = {},
		['core.keybinds'] = {
			config = {
				default_keybings = true,
				neorg_leader = '<leader>o',
			},
		},
		['core.norg.qol.toc'] = {},
		['core.norg.esupports.hop'] = {},
		['core.integrations.telescope'] = {},
		['core.zettelkasten'] = {},
		['core.norg.journal'] = {},
		['core.presenter'] = {
			config = {
				zen_mode = 'truezen',
			},
		},
		['core.norg.dirman'] = {
			config = {
				workspaces = {
					neorg = '~/docs/notes/neorg',
				},
			},
		},
		['core.norg.completion'] = {
			config = {
				engine = 'nvim-cmp',
			},
		},
	},
})
