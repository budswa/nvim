local neorg = require('neorg')

neorg.setup({
	load = {
		['core.defaults'] = {},
		['core.norg.concealer'] = {},
		['core.norg.dirman'] = {
			config = {
				workspaces = {
					my_workspace = '~/docs/notes/neorg',
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
