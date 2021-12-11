require('dressing').setup({
	input = {
		default_prompt = '➤ ',
		relative = 'editor',
	},
	select = {
		backend = { 'telescope', 'nui' },
		telescope = {
			theme = 'ivy',
		},
	},
})
