local telescope = require('telescope')
local themes = require('telescope.themes')

telescope.setup({
	defaults = {
		prompt_prefix = '',
		color_devicons = true,
	},
	pickers = {
		find_files = { theme = 'ivy' },
		live_grep = { theme = 'ivy' },
		buffers = { theme = 'ivy' },
		help_tags = { theme = 'ivy' },
		commands = { theme = 'ivy' },
		builtin = { theme = 'ivy' },
		planets = { theme = 'ivy' },
	},
	extensions = {
		['ui-select'] = {
			themes.get_ivy(),
		},
	},
})

telescope.load_extension('ui-select')
telescope.load_extension('luasnip')
