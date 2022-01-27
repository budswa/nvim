require('notify').setup({
	stages = 'static',
	timeout = 4000,
	background_colour = '#24292e',
})

vim.notify = require('notify')
