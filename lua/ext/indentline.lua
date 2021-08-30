require("indent_blankline").setup({
	show_end_of_line = true,
	char = '▏',
	buftype_exclude = {"terminal"},
	filetype_exclude = {
		'dashboard',
		'help',
		'man',
		'packer',
		'NvimTree',
		'Trouble'
	},
})
