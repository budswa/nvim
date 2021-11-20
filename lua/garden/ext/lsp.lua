local lspconfig = require('lspconfig')
local installer = require('nvim-lsp-installer')
local servers = require('nvim-lsp-installer.servers')
local null = require('null-ls')

local required_servers = {
	'sumneko_lua',
	'vimls',
	'gopls',
	'rust_analyzer',
	'pyright',
	'yamlls',
	'jsonls',
}

vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E', numhl = 'LspDiagnosticsDefaultError' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W', numhl = 'LspDiagnosticsDefaultWarning' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'I', numhl = 'LspDiagnosticsDefaultInformation' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H', numhl = 'LspDiagnosticsDefaultHint' })

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = true,
	signs = {
		enable = true,
		priority = 10,
	},
	update_in_insert = true,
})

local if_nil = function(val, default)
	if val == nil then
		return default
	end
	return val
end

local update_capabilities = function(capabilities, override)
	override = override or {}

	local completionItem = capabilities.textDocument.completion.completionItem

	completionItem.snippetSupport = if_nil(override.snippetSupport, true)
	completionItem.preselectSupport = if_nil(override.preselectSupport, true)
	completionItem.insertReplaceSupport = if_nil(override.insertReplaceSupport, true)
	completionItem.labelDetailsSupport = if_nil(override.labelDetailsSupport, true)
	completionItem.deprecatedSupport = if_nil(override.deprecatedSupport, true)
	completionItem.commitCharactersSupport = if_nil(override.commitCharactersSupport, true)
	completionItem.tagSupport = if_nil(override.tagSupport, { valueSet = { 1 } })
	completionItem.resolveSupport = if_nil(override.resolveSupport, {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	})

	return capabilities
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = update_capabilities(capabilities)

local on_attach = function(_, bufnr)
	require('garden/mappings').lsp(bufnr)

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

installer.settings({
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

-- Install missing servers
for _, svr in pairs(required_servers) do
	local ok, lsp_server = servers.get_server(svr)
	if ok then
		if not lsp_server:is_installed() then
			print('Installing' .. svr)
			lsp_server:install()
		end
	end
end

installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = vim.loop.cwd,
	}

	if server.name == 'sumneko_lua' then
		opts = require('lua-dev').setup({
			library = { plugins = true, types = true, vimruntime = true },
			lspconfig = {
				runtime = {
					version = 'LuaJIT',
					path = runtime_path,
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					maxPreload = 10000,
					preloadFileSize = 10000,
				},
			},
		})
	end
	if server.name == 'pyright' then
		opts.settings = {
			pyright = {
				flags = {
					allow_incremental_sync = true,
				},
			},
		}
	end
	server:setup(opts)
end)

null.config({
	debounce = 150,
	debug = true,
	sources = {
		null.builtins.code_actions.gitsigns,
		null.builtins.code_actions.refactoring,
		null.builtins.diagnostics.luacheck,
		null.builtins.formatting.stylua,
		null.builtins.formatting.markdownlint,
		null.builtins.formatting.prettier,
		null.builtins.formatting.black,
		null.builtins.formatting.clang_format,
		null.builtins.formatting.rustfmt,
		null.builtins.formatting.gofmt,
		null.builtins.formatting.goimports,
	},
})

lspconfig['null-ls'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	autostart = true,
})
