require('zen-mode').setup({
	window = {
		backdrop = 1,
		width = 0.8,
		height = 0.8,
		options = {
			signcolumn = 'no',
			number = false,
			relativenumber = false,
			foldcolumn = '0',
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false,
			showcmd = false,
		},
		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
	},
})
