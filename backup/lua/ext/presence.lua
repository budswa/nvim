require("presence"):setup({
	auto_update       = true,
	editing_text      = "Editing %s",
	workspace_text    = "Working on %s",
	neovim_image_text = "Neovim",
	main_image        = "neovim",
	client_id         = "793271441293967371",       -- Use your own Discord application client id (not recommended)
	debounce_timeout  = 15,                         -- Number of seconds to debounce TextChanged events (or calls to `:lua Presence:update(<buf>, true)`)
})
