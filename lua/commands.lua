vim.api.nvim_create_user_command('Profile', function()
	_G.__luacache.print_profile()
end, {})
