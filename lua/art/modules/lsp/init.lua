local lspconfig = require('lspconfig')
local install = require('nvim-lsp-installer')

local on_attach = require('art.modules.lsp.on_attach')
local capabilities = require('art.modules.lsp.capabilities')

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

install.setup({ ensure_installed = { 'sumneko_lua', 'vimls', 'clangd', 'pyright', 'dockerls', 'jsonls' } })

require('lsp-format').setup({})

local signs = { Error = 'E', Warn = 'W', Info = 'I', Hint = 'H' }
for sign, icon in pairs(signs) do
	vim.fn.sign_define(
		'DiagnosticSign' .. sign,
		{ text = icon, texthl = 'Diagnostic' .. sign, linehl = false, numhl = 'Diagnostic' .. sign }
	)
end

vim.diagnostic.config({
	float = {
		focusable = false,
		border = border,
		scope = 'cursor',
		header = { 'Diagnostic', 'DiagnosticHeader' },
	},
	underline = false,
	signs = {
		enable = true,
		priority = 10,
	},
	virtual_text = false,
	update_in_insert = true,
	severity_sort = true,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with({ vim.lsp.handlers.signature_help, border = 'rounded' })

local function opts(server)
	return vim.tbl_deep_extend('force', {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
	}, require('art.modules.lsp.servers.' .. server))
end

lspconfig.sumneko_lua.setup(opts('sumneko_lua'))
lspconfig.pyright.setup(opts('pyright'))
