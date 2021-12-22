require('persistence').setup({
	dir = vim.fn.expand(vim.fn.stdpath('data') .. '/.sessions/'),
})
