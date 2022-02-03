require('themer').setup({
	colorscheme = 'papa_dark',
	styles = {
		comment = { style = 'italic' },
		['function'] = { style = 'italic' },
		functionbuiltin = { style = 'italic' },
		variable = { style = 'italic' },
		variableBuiltIn = { style = 'italic' },
		parameter = { style = 'italic' },
	},
})

vim.cmd(string.format('hi CursorLineNr guibg=#%06x',  vim.api.nvim_get_hl_by_name('CursorLine', true).background))
