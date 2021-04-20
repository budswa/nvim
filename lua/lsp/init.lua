vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ text = "●", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ text = "●", texthl = "LspDiagnosticsSignWarning", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ text = "●", texthl = "LspDiagnosticsSignInformation", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ text = "●", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" }
)

require("lspkind").init()
require'lsp_signature'.on_attach()

require('lsp/vimls')
require('lsp/luals')
require('lsp/phpls')
require('lsp/htmlls')
require('lsp/cssls')
require('lsp/bashls')
require('lsp/gdls')
require('lsp/jsonls')
require('lsp/pyls')
require('lsp/gopls')
require('lsp/clangd')
require('lsp/omnisharp')
