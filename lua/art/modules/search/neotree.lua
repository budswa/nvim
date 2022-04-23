vim.g.neo_tree_remove_legacy_commands = 1
require('neo-tree').setup({
    close_if_last_window = false,
    enable_diagnostics = true,
    enable_git_status = true,
    popup_border_style = 'rounded',
    default_component_configs = {
        name = {
            trailing_slash = true,
            use_git_status_colors = true,
        },
    },
    window = {
        width = 36,
    },
    filesystem = {
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,
    },
})
