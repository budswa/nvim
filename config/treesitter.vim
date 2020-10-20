lua <<EOF
	require'nvim-treesitter.configs'.setup {
		ensure_installed = "all",     -- one of "all", "language", or a list of languages
		highlight = {
			enable = true,              -- false will disable the whole extension
		},
		refactor = {
			highlight_definitions = { enable = true },
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false -- Whether the query persists across vim sessions
		}
	}
EOF
