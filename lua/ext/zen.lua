require("true-zen").setup({
	true_false_commands = true,
	cursor_by_mode = true,
	bottom = {
		hidden_laststatus = 0,
		hidden_ruler = false,
		hidden_showmode = false,
		hidden_showcmd = true,
		hidden_cmdheight = 1,

		shown_laststatus = 2,
		shown_ruler = false,
		shown_showmode = false,
		shown_showcmd = true,
		shown_cmdheight = 1
	},
	top = {
		hidden_showtabline = 0,
		shown_showtabline = 2
	},
	left = {
		hidden_number = false,
		hidden_relativenumber = false,
		hidden_signcolumn = "no",

		shown_number = true,
		shown_relativenumber = false,
		shown_signcolumn = "yes"
	},
	ataraxis = {
		left_right_padding = 32
	}
})
