require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
    tree_docs = { enable = true },
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = { enable = true },
    --autopairs = { enable = true },
	playground = {
		enable = true,
		updatetime = 25,
		persist_queries = true,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = {'#98C579', '#61AFEF'}
	},
})