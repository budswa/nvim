require('garden/utils').nvim_create_augroups({
	packer = {
		{ 'BufWritePost', 'plugins.lua', [[PackerCompile]] },
	},
	check_update = {
		{ 'FocusGained', '*', [[checktime]] },
	},
	yank = {
		{ 'TextYankPost', '*', [[silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=500})]] },
	},
	cursorline = {
		{ 'WinEnter', '*', [[set cursorline]] },
		{ 'WinLeave', '*', [[set nocursorline]] },
	},
	cursorword = {
		{ 'Vimenter,ColorScheme', '*', [[lua require('garden.modules.cursorword').highlight()]] },
		{ 'CursorMoved,CursorMovedI', '*', [[lua require('garden.modules.cursorword').matchadd()]] },
		{ 'WinLeave', '*', [[lua require('garden.modules.cursorword').matchdelete()]] },
	},
	telescope = {
		{ 'Filetype', 'TelescopePrompt', [[lua require('cmp').setup.buffer { enabled = false }]] },
		{ 'User', 'TelescopePreviewerLoaded', 'setlocal wrap' },
	},
	quick_close = {
		{ 'Filetype', 'help,startuptime,lspinfo,qf', [[nnoremap <buffer><silent> q :close<CR>]] },
	},
	mkdir = {
		{ 'BufWritePre', '*', [[lua require('garden.modules.mkdir').mkdir()]] },
	},
})
