require('dressing').setup({
	input = {
		default_prompt = '➤ ',
		relative = 'editor',
	},
	select = {
		backend = { 'telescope', 'nui' },
		telescope = require('telescope.themes').get_ivy(),
		nui = {
			position = '50%',
			relative = 'editor',
			border = { style = 'rounded' },
		},
	},
})
