vim.cmd([[
	augroup HideCursor
		au!
		au BufWinEnter,WinEnter,CmdLineLeave <buffer> set guicursor=a:block-Cursor/Cursor-blinkon0,
		au BufLeave,WinClosed,WinLeave,CmdLineEnter <buffer> set guicursor&
	augroup END
]])

vim.opt_local.numberwidth = 0
vim.opt_local.number = false
vim.opt_local.relativenumber = false
