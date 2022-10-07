require("art.options")

vim.cmd.highlight("clear")
require("art.colors").set()

require("art.filetypes")
require("art.autocommands")
require("art.commands")
require("art.keymaps")
require("art.utils")
require("art.plugins")

if require("art.utils").exists(vim.fn.stdpath("config") .. "/lua/compiled.lua") then require("compiled") end
