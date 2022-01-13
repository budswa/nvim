require('nvim-tree').setup({
	view = {
		width = 30,
		side = 'left',
		signcolumn = 'no',
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	trash = {
		cmd = 'trash',
		require_confirm = true,
	},
	tree_ignore = { '.git', 'node_modules' },
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	auto_close = true,
	respect_buf_cwd = true,
	indent_markers = true,
	git_hl = true,
})
