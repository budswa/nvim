local neorg = require('neorg')

neorg.setup({
	load = {
		['core.defaults'] = {},
		['core.ui'] = {},
		['core.neorgcmd'] = {},
		['core.norg.concealer'] = {
			config = {
				markup_preset = 'dimmed',
				icon_preset = 'diamond',
			},
		},
		['core.integrations.treesitter '] = {},
		['core.keybinds'] = {
			config = {
				default_keybings = true,
				neorg_leader = '<leader>o',
			},
		},
		['core.norg.qol.toc'] = {
			config = {
				close_split_on_jump = false,
				toc_split_placement = 'left',
			},
		},
		['core.norg.esupports.hop'] = {},
		['core.integrations.telescope'] = {},
		--['core.zettelkasten'] = {},
		['core.norg.journal'] = {
			config = {
				workspaces = 'journal',
			},
		},
		['core.presenter'] = {
			config = {
				zen_mode = 'zen-mode',
				slide_count = {
					enable = true,
					position = 'top',
					count_format = '[%d/%d]',
				},
			},
		},
		['core.norg.dirman'] = {
			config = {
				workspaces = {
					neorg = '~/docs/notes/neorg',
					gtd = '~/docs/notes/gtd',
					journal = '~/docs/notes/journal',
				},
			},
		},
		['core.gtd.base'] = {
			config = {
				workspace = 'gtd',
				displayers = {
					close_after_task_select = false,
				},
			},
		},
		['core.norg.completion'] = {
			config = {
				engine = 'nvim-cmp',
			},
		},
		['core.export'] = {},
		['core.export.markdown'] = {
			config = {
				extensions = 'all',
			},
		},
	},
	logger = {
		level = 'warn',
	},
})
