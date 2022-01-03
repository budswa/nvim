local M = {}

local lspconfig = require('lspconfig')
local installer = require('nvim-lsp-installer')
local servers = require('nvim-lsp-installer.servers')
local null = require('null-ls')
local b = null.builtins

local required_servers = {
	'sumneko_lua',
	'vimls',
	'clangd',
	'gopls',
	'rust_analyzer',
	'pyright',
	'yamlls',
	'jsonls',
}

--local signs = { Error = "E", Warn = "W", Info = "I", Hint = "H" }
--for sign, icon in pairs(signs) do
--	vim.fn.sign_define(
--		"DiagnosticSign" .. sign,
--		{ text = icon, texthl = "Diagnostic" .. sign, linehl = false, numhl = "Diagnostic" .. sign }
--	)
--end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		prefix = '▸',
		spacing = 5,
		severity_limit = 'Warning',
	},
	signs = {
		enable = false,
		priority = 10,
	},
	update_in_insert = true,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with({
	vim.lsp.handlers.signature_help,
	border = 'rounded',
})

local update_capabilities = function(capabilities)
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = { 'documentation', 'detail', 'additionalTextEdits' },
	}
	capabilities.textDocument.codeAction = {
		dynamicRegistration = false,
		codeActionLiteralSupport = {
			codeActionKind = {
				valueSet = {
					'',
					'quickfix',
					'refactor',
					'refactor.extract',
					'refactor.inline',
					'refactor.rewrite',
					'source',
					'source.organizeImports',
				},
			},
		},
	}
	return capabilities
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = update_capabilities(capabilities)

M.on_attach = function(_, bufnr)
	require('garden.keybinds').lsp(bufnr)

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
	vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

	require('lsp_signature').on_attach({
		bind = true,
		max_height = 12,
		max_width = 120,
		transpancy = 20,
		handler_opts = { border = 'rounded' },
	})
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

installer.settings({
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

-- Install missing servers
for _, s in pairs(required_servers) do
	local ok, lsp_server = servers.get_server(s)
	if ok then
		if not lsp_server:is_installed() then
			print('Installing ' .. s)
			lsp_server:install()
		end
	end
end

installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = M.on_attach,
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

null.setup({
	debounce = 100,
	debug = true,
	sources = {
		b.code_actions.gitrebase,
		b.code_actions.gitsigns,
		b.code_actions.proselint,
		b.code_actions.refactoring,
		b.diagnostics.cppcheck,
		b.diagnostics.flake8,
		b.diagnostics.luacheck,
		b.diagnostics.proselint,
		b.diagnostics.pylama,
		b.diagnostics.pylint,
		b.diagnostics.selene.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/selene.toml' } }),
		b.diagnostics.vale,
		b.formatting.black,
		b.formatting.clang_format,
		b.formatting.gofmt,
		b.formatting.goimports,
		b.formatting.markdownlint,
		b.formatting.prettier,
		b.formatting.rustfmt,
		b.formatting.stylua.with({ extra_args = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' } }),
	},
})

lspconfig['null-ls'].setup({
	on_attach = M.on_attach,
	capabilities = capabilities,
	autostart = true,
})

return M
