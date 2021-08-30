local util = require('util')

local definitions = {
	packer = {
		{ 'BufWritePost', 'plugins.lua', 'PackerCompile' },
	},
	trailing_whitespace = {
		{ 'BufWritePre', '*', [[silent! lua require('util').remove_trailing_whitespace()]] },
	},
	dashboard = {
		{ 'FileType', 'dashboard', 'set showtabline=0' },
	},
	window = {
		{ 'VimResized', '*', 'tabdo wincmd =' }, -- When resizing nvim window, equalize window dimensions
		{ 'FocusGained', '*', 'checktime' }, -- More eager version of autoread
	},
	yank = {
		{ 'TextYankPost', [[* silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=400})]] },
	},
	cursorline = {
		{ 'WinEnter', '*', 'set cursorline' },
		{ 'WinLeave', '*', 'set nocursorline' }
	}
}
util.create_augroups(definitions)
