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
		group = '+',
	},
	popup_mappings = {
		scroll_down = '<C-d>',
		scroll_up = '<C-u>',
	},
	window = {
		position = 'bottom',
		margin = { 0, 0, 0, 0 },
		padding = { 1, 1, 1, 1 },
		winblend = 20,
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
