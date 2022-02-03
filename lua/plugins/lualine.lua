require('lualine').setup({
	options = {
		theme = 'gruvbox',
		section_separators = '',
		component_separators = '',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'filename' },
		lualine_c = { '' },
		lualine_x = { 'branch', { 'diff' } },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},
	extensions = { 'nvim-tree', 'quickfix', 'toggleterm' },
})
