vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
require("nvim-lightbulb").update_lightbulb({
	sign = {
		enabled = true,
		priority = 10,
	},
	float = {
		enabled = false,
		text = "•",
	},
	virtual_text = {
		enabled = false,
		text = "•",
	},
})
