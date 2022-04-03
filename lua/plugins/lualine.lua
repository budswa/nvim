local colors = {
	blue = '#80a0ff',
	cyan = '#79dac8',
	black = '#24292e',
	white = '#c6c6c6',
	red = '#ff5189',
	violet = '#d183e8',
	grey = '#0d1117',
}

require('lualine').setup({
	options = {
		theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.black, bg = colors.black },
			},
			insert = { a = { fg = colors.black, bg = colors.blue, gui = 'bold' } },
			visual = { a = { fg = colors.black, bg = colors.cyan, gui = 'bold' } },
			replace = { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.black, bg = colors.black },
			},
		},
		component_separators = '│',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '' }, right_padding = 2 },
		},
		lualine_b = { 'filename', 'branch' },
		lualine_c = { 'fileformat' },
		lualine_x = {},
		lualine_y = { 'filetype', 'progress' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},
	tabline = {},
	extensions = { 'quickfix', 'nvim-tree', 'toggleterm' },
})
