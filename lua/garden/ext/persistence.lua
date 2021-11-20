require('persistence').setup({
	dir = vim.fn.expand(vim.fn.stdpath('data') .. '/.sessions/'), -- directory where session files are saved
})
