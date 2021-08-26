local util = require("util")

local definitions = {
	buffer = {
		{ "BufWritePre", "*", [[silent! lua require('util').remove_trailing_whitespace()]] },
		{ "BufWritePost", "plugins.lua", "PackerCompile" },
	},
	window = {
		{ "VimLeave", "*", [[wshada!]] },
		{ "VimResized", "*", [[tabdo wincmd =]] }, -- When resizing nvim window, equalize window dimensions
		{ "FocusGained", "*", [[checktime]] }, -- More eager version of autoread
	},
	ft = {
		-- { "FileType", "NvimTree", "setlocal winhighlights=Normal:Terminal" },
		{ "FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2" },
	},
	yank = {
		{ "TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]] },
	},
	cursorline = {
		{ "WinEnter", "*", "set cursorline"},
		{ "WinLeave", "*", "set nocursorline"}
	}
}
util.create_augroups(definitions)