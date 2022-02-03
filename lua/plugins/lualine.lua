local function time()
	local t = os.date('%H:%M:%S')
	return t
end

require('lualine').setup({
	options = {
		disabled_filetypes = { 'alpha' },
		theme = 'auto',
		section_separators = ' ',
		component_separators = '',
		always_divide_middle = false
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'filename' },
		lualine_c = { time },
		lualine_x = {},
		lualine_y = {
			'branch',
			{
			    'diff',
				symbols = { added = '+', modified = '~', removed = '-' }
			},
			'progress'
		},
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

local timer = vim.loop.new_timer()
timer:start(
	0,
	100,
	vim.schedule_wrap(function()
		vim.api.nvim_command('redrawstatus')
	end)
)

