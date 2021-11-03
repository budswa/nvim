require('indent_blankline').setup({
	char = '▏',
	viewport_buffer = 20,
	show_current_context = true,
	show_end_of_line = true,
	use_treesitter = true,
	buftype_exclude = {
		'terminal',
		'nofile',
	},
	filetype_exclude = {
		'floatline',
		'alpha',
		'help',
		'man',
		'packer',
		'NvimTree',
		'Trouble',
	},
})
