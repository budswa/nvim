require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "", numhl = "gitsignsAdd" },
		change = { hl = "GitSignsChange", text = "", numhl = "gitsignsChange" },
		changedelete = { hl = "GitSignsDelete", text = "", numhl = "gitsignsDelete" },
		delete = { hl = "GitSignsDelete", text = "", numhl = "gitsignsDelete" },
		topdelete = { hl = "GitSignsDelete", text = "", numhl = "gitsignsDelete" },
		-- add = { hl = "GitSignsAdd", text = "▍", numhl = "gitsignsAdd" },
		-- change = { hl = "GitSignsChange", text = "▍", numhl = "gitsignsChange" },
		-- changedelete = { hl = "GitSignsDelete", text = "▍", numhl = "gitsignsDelete" },
		-- delete = { hl = "GitSignsDelete", text = "▍", numhl = "gitsignsDelete" },
		-- topdelete = { hl = "GitSignsDelete", text = "▍", numhl = "gitsignsDelete" },
	},
	numhl = true,
	keymaps = {
		noremap = true,
		buffer = true,

		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

		["n <leader>hs"] = "<cmd>lua require\"gitsigns\".stage_hunk()<CR>",
		["n <leader>hu"] = "<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>",
		["n <leader>hr"] = "<cmd>lua require\"gitsigns\".reset_hunk()<CR>",
		["n <leader>hp"] = "<cmd>lua require\"gitsigns\".preview_hunk()<CR>",
		["n <leader>hb"] = "<cmd>lua require\"gitsigns\".blame_line()<CR>",
	},
	watch_index = {
		interval = 100,
	},
	sign_priority = 6,
})
