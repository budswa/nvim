local telescope = require('telescope')
local themes = require('telescope.themes')

telescope.setup({
	defaults = themes.get_ivy({
		selection_caret = '➤ ',
		prompt_prefix = ' ',
		results_title = true,
		color_devicons = true,
		preview = {
			hide_on_startup = true,
		},
		layout_config = {
			height = 36,
		},
		mappings = {
			i = {
				['<C-h>'] = 'which_key',
			},
		},
	}),
})

telescope.load_extension('zk')
telescope.load_extension('frecency')
telescope.load_extension('file_browser')
