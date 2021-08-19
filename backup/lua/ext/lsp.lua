-- local util = require("lspconfig/util")
local lspconfig = require('lspconfig')

vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ text = "●", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "", priority = 10 }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ text = "●", texthl = "LspDiagnosticsSignWarning", linehl = "", numhl = "", priority = 10 }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ text = "●", texthl = "LspDiagnosticsSignInformation", linehl = "", numhl = "", priority = 10 }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ text = "●", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "", priority = 10 }
)

-- lua language server
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local luadev = require("lua-dev").setup({
	lspconfig = {-- add any options here, or leave empty to use the default settings
		cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					path = vim.split(package.path, ';'),
				},
				diagnostics = {
					globals = {'vim', 'use'},
				},
			},
		},
	},
})


lspconfig.sumneko_lua.setup(luadev)

-- Rust_analyzer
require'lspconfig'.rust_analyzer.setup{
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
}

-- Pyright
require'lspconfig'.pyright.setup{}

-- Clangd
require'lspconfig'.clangd.setup{}
