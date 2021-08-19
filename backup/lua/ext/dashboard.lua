vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_session_directory = vim.fn.expand(vim.fn.stdpath("config") .. "/.session//")
if vim.fn.isdirectory(vim.g.dashboard_session_directory) == 0 then
	vim.fn.mkdir(vim.g.dashboard_session_directory, "p")
end


vim.g.dashboard_custom_section = {

	last_session = {
		description = { "  Load session                           SPC s l" },
		command = "SessionLoad",
	},
	find_history = {
		description = { "  Recently opened files                  SPC f h" },
		command = "DashboardFindHistory",
	},
	find_file = {
		description = { "  Find file                              SPC f f" },
		command = "DashboardFindFile",
	},
	find_word = {
		description = { "  Find word                              SPC f w" },
		command = "DashboardFindWord",
	},
	new_file = {
		description = { "  New file                               SPC t f" },
		command = "DashboardNewFile",
	},
}
