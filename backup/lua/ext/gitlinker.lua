require"gitlinker".setup({
  opts = {
    add_current_line_on_normal_mode = true,
    action_callback = require"gitlinker.actions".copy_to_clipboard,
		print_url = true,
		mappings = "<leader>gy" -- mapping to call url generation
  },
	callbacks = {
		["github.com"] = require"gitlinker.hosts".get_github_type_url,
		["gitlab.com"] = require"gitlinker.hosts".get_gitlab_type_url,
	}
})


