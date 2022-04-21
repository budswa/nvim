local heirline = require('heirline')
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('colors').get()

local components = require('plugins.stl.components')

heirline.setup({
	{
		init = utils.pick_child_on_condition,
		default_statusline,
		--inactive_statusline,
		--help_file_statusline,
		--terminal_statusline,
		--filetree_statusline,
	},
})
