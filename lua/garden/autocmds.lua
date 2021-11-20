require('garden/utils').nvim_create_augroups({
	packer = {
		{ 'BufWritePost', 'plugins.lua', [[PackerCompile]] },
	},
	window = {
		{ 'FocusGained', '*', [[checktime]] },
	},
	yank = {
		{ 'TextYankPost', '*', [[silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=500})]] },
	},
	cursorline = {
		{ 'WinEnter', '*', [[set cursorline]] },
		{ 'WinLeave', '*', [[set nocursorline]] },
	},
	telescope = {
		{ 'Filetype', 'TelescopePrompt', [[lua require('cmp').setup.buffer { enabled = false }]] },
	},
})
