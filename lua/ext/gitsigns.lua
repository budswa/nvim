vim.cmd [[packadd gitsigns.nvim]]

require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "", numhl = "gitsignsAdd" },
		change = { hl = "GitSignsChange", text = "", numhl = "gitsignsChange" },
		changedelete = { hl = "GitSignsDelete", text = "", numhl = "gitsignsDelete" },
		delete = { hl = "GitSignsDelete", text = "", numhl = "gitsignsDelete" },
		topdelete = { hl = "GitSignsDelete", text = "", numhl = "gitsignsDelete" },
	},
	numhl = true,
	keymaps = {
		noremap = true,
		buffer = true,

		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

		["n <leader>gs"] = "<cmd>lua require\"gitsigns\".stage_hunk()<CR>",
		["n <leader>gu"] = "<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>",
		["n <leader>gr"] = "<cmd>lua require\"gitsigns\".reset_hunk()<CR>",
		["n <leader>gp"] = "<cmd>lua require\"gitsigns\".preview_hunk()<CR>",
		["n <leader>gB"] = "<cmd>lua require\"gitsigns\".blame_line()<CR>",
	},
	watch_index = {
		interval = 100,
	},
	sign_priority = 6,
})
