local notify = require('notify')

vim.notify = notify

notify.setup({
	stages = 'static',
	timeout = 4000,
	background_colour = '#24292e',
})
