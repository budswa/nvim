vim.g.neo_tree_remove_legacy_commands = 1
require('neo-tree').setup({
	enable_diagnostics = true,
	event_handlers = {
		{
			event = 'vim_win_enter',
			handler = function(arg)
				vim.cmd([[setlocal scl=no]])
			end,
		},
	},
})
