vim.g.mapleader = ' '

require("which-key").setup({
	plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "+", -- symbol used in the command line area that shows your active key combo
    separator = ">", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    position = "bottom",
    margin = { 1, 1, 1, 1 }, -- [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 24 },
    width = { min = 20, max = 50 },
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local wk = require("which-key")

wk.register({

})
