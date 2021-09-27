local util = require('util')

local definitions = {
	packer = {
		{ 'BufWritePost', 'plugins.lua', 'PackerCompile' },
	},
	whitespace = {
		{ 'BufWritePre', '*', [[silent! lua require('util').remove_trailing_whitespace()]] },
	},
	window = {
		{ 'VimResized', '*', 'tabdo wincmd =' },
		{ 'FocusGained', '*', 'checktime' },
	},
	yank = {
		{ 'TextYankPost', [[* silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=500})]] },
	},
	cursorline = {
		{ 'WinEnter', '*', 'set cursorline' },
		{ 'WinLeave', '*', 'set nocursorline' }
	},
}
util.create_augroups(definitions)
