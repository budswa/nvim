require('utils').nvim_create_augroups({
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
		{ 'WinEnter,InsertLeave', '*', [[set cursorline]] },
		{ 'WinLeave,InsertEnter', '*', [[set nocursorline]] },
	},
	quick_close = {
		{ 'Filetype', 'help,startuptime,lspinfo,qf', [[nnoremap <buffer><silent> q :close<cr>]] },
	},
	cursorword = {
		{ 'Vimenter,ColorScheme', '*', [[lua require('modules.cursorword').highlight()]] },
		{ 'CursorMoved,CursorMovedI', '*', [[lua require('modules.cursorword').matchadd()]] },
		{ 'WinLeave', '*', [[lua require('modules.cursorword').matchdelete()]] },
	},
	whitespace = {
		{ 'InsertEnter', '*', [[lua require('modules.whitespace').onInsertEnter()]] },
		{ 'InsertLeave', '*', [[lua require('modules.whitespace').onInsertLeave()]] },
		{ 'TextChangedI', '*', [[lua require('modules.whitespace').onTextChangedI()]] },
		{ 'TextChanged', '*', [[lua require('modules.whitespace').onTextChanged()]] },
		{ 'BufEnter', '*', [[lua require('modules.whitespace').onBufEnter()]] },
		{ 'BufLeave', '*', [[lua require('modules.whitespace').onBufLeave()]] },
	},
	mkdir = {
		{ 'BufWritePre', '*', [[lua require('modules.mkdir').mkdir()]] },
	},
	telescope = {
		{
			'User',
			'TelescopeFindPre',
			[[
				lua vim.o.laststatus=0; vim.cmd'autocmd BufWinLeave * ++once lua vim.o.laststatus=2'
			]],
		},
	},
})
