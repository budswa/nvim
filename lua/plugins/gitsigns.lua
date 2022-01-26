require('gitsigns').setup({
	signs = {
		--add = { hl = 'GitSignsAdd', text = '▏' },
		--change = { hl = 'GitSignsChange', text = '▏' },
		--delete = { hl = 'GitSignsDelete', text = '▁' },
		--topdelete = { hl = 'GitSignsDelete', text = '▔' },
		--changedelete = { hl = 'GitSignsChange', text = '▏' },
		add = { hl = 'GitSignsAdd', text = '▍' },
		change = { hl = 'GitSignsChange', text = '▍' },
		delete = { hl = 'GitSignsDelete', text = '▁' },
		topdelete = { hl = 'GitSignsDelete', text = '▔' },
		changedelete = { hl = 'GitSignsChange', text = '▍' },
	},
	signcolumn = false,
	numhl = true,
	attach_to_untracked = true,
})
