require('zk').setup({
	create_user_commands = true,
	lsp = {
		config = {
			cmd = { 'zk', 'lsp' },
			name = 'zk',
		},

		auto_attach = {
			enabled = true,
			filetypes = { 'markdown' },
		},
	},
})
