require('auto-session').setup{
	auto_session_enable_last_session=false,
	auto_session_root_dir = vim.fn.expand(vim.fn.stdpath("config") .. "./session//")
}
