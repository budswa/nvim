require('session_manager').setup({
	--options = { 'buffers', 'curdir', 'folds', 'terminal', 'winsize' }
	sessions_dir = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/'),
	autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
	autosave_last_session = true,
	autosave_ignore_not_normal = true,
	autosave_only_in_session = true
})
