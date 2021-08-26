require("indent_blankline").setup({
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
