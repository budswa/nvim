vim.cmd[[packadd nvim-tree.lua]]

local g = vim.g

g.nvim_tree_width = 28
g.nvim_tree_side = "left"
g.nvim_tree_ignore = { ".git", "node_modules", ".cahce", ".undodir", ".backupdir" }
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_tab_open = 1
g.nvim_tree_hijack_netrw = 1


vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
  }

  vim.g.nvim_tree_icons = {
    default = '',
    git = {
      unstaged = "U",
      staged = "S",
      unmerged = "",
      renamed = ">",
      untracked = "★"
    },
    folder = {
      default = "",
      open = "",
			empty = "",
			empty_open = "",
			symlink = ""
    }
  }
