require('indent_blankline').setup({
	debug = true,
	char = '▏',
	viewport_buffer = 20,
	show_current_context = true,
	show_current_context_start = true,
	context_higlight_list = { 'healthSuccess' },
	show_end_of_line = true,
	use_treesitter = true,
	buftype_exclude = {
		'nofile',
		'terminal',
	},
	filetype_exclude = {
		'help',
		'man',
		'log',
		'packer',
		'alpha',
		'NvimTree',
		'Trouble',
		'floatline',
	},
})
