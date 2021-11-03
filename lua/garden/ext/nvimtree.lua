require'nvim-tree'.setup {
	view = {
	    width = 30,
		side = 'left',
	},
	update_focused_file = {
		enable = true,
		update_cwd  = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	auto_close = true,
	respect_buf_cwd = true,
	indent_markers = true,
}