vim.api.nvim_add_user_command('Profile', function()
	_G.__luacache.print_profile()
end, {})
