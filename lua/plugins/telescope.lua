local telescope = require('telescope')
local themes = require('telescope.themes')
local actions = require('telescope.actions')

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
				['<C-J>'] = actions.move_selection_next,
				['<C-K>'] = actions.move_selection_previous,
				['<TAB>'] = actions.toggle_selection,
				['<S-TAB>'] = actions.send_selected_to_qflist + actions.open_qflist,
				['<C-DOWN>'] = actions.cycle_history_next,
				['<C-UP>'] = actions.cycle_history_prev,
				['<C-q>'] = R('telescope').extensions.hop.hop,
				['<C-h>'] = 'which_key',
			},
		},
	}),
})

telescope.load_extension('zk')
telescope.load_extension('hop')
telescope.load_extension('frecency')
telescope.load_extension('file_browser')
