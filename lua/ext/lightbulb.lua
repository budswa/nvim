vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
require("nvim-lightbulb").update_lightbulb({
	sign = {
		enabled = false,
		priority = 10,
	},
	float = {
		enabled = true,
		text = "•",
	},
	virtual_text = {
		enabled = true,
		text = "•",
	},
})
