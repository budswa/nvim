require("true-zen").setup({
	true_false_commands = true,
	cursor_by_mode = true,
	before_minimalist_mode_shown = true,
	before_minimalist_mode_hidden = true,
	after_minimalist_mode_shown = true,
	after_minimalist_mode_hidden = true,
	bottom = {
		hidden_laststatus = 0,
		hidden_ruler = false,
		hidden_showmode = false,
		hidden_showcmd = false,
		hidden_cmdheight = 1,
		shown_laststatus = 2,
		shown_ruler = false,
		shown_showmode = false,
		shown_showcmd = false,
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
		shown_relativenumber = true,
		shown_signcolumn = "yes"
	},
	ataraxis = {
		just_do_it_for_me = true,
		left_padding = 40,
		right_padding = 40,
		top_padding = 1,
		bottom_padding = 1,
	},
	focus = {
		margin_of_error = 5
	},
	integrations = {
		integration_galaxyline = true,
		integration_vim_airline = false,
		integration_vim_powerline = false,
		integration_tmux = false,
		integration_express_line = false,
		integration_gitgutter = false,
		integration_vim_signify = false,
		integration_limelight = false
	}
})

require("true-zen").before_minimalist_mode_shown = function ()
	vim.cmd("TSContextDisable")
end

require("true-zen").after_minimalist_mode_shown = function ()
	vim.cmd("TSContextEnable")
end

require("true-zen").before_minimalist_mode_hidden = function ()
	vim.cmd("TSContextDisable")
end

require("true-zen").after_minimalist_mode_hidden = function ()
	vim.cmd("TSContextEnable")
end



