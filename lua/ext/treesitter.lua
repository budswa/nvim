require('nvim-treesitter.configs').setup({
	ensure_installed = 'maintained',
	tree_docs = { enable = true },
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = { enable = true },
	autopairs = { enable = true },
	playground = {
		enable = true,
		updatetime = 25,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = { '#98C579', '#61AFEF' },
	},
})
