local luasnip = require('luasnip')
local types = require('luasnip.util.types')

luasnip.config.setup({
	history = true,
	updateevents = 'TextChanged, TextChangedI',
	region_check_events = 'CursorMoved',
	delete_check_events = 'TextChanged, InsertLeave',
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { '●', 'GruvboxOrange' } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { '●', 'GruvboxBlue' } },
			},
		},
	},
})

require('luasnip.loaders.from_vscode').load()
