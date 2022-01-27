vim.cmd([[
	augroup HideCursor
		au!
		au BufWinEnter,WinEnter,CmdLineLeave <buffer> set guicursor=a:block-Cursor/Cursor-blinkon0,
		au BufLeave,WinClosed,WinLeave,CmdLineEnter <buffer> set guicursor&
	augroup END
]])

vim.opt.cursorline = true
