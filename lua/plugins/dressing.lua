require('dressing').setup({
	input = {
		default_prompt = '➤ ',
		relative = 'editor',
	},
	select = {
		backend = { 'telescope', 'nui' },
		telescope = { theme = 'ivy' },
		nui = {
			position = '50%',
			relative = 'editor',
			border = { style = 'rounded' },
		},
	},
})
