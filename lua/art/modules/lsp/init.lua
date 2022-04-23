local install = require('nvim-lsp-installer')
local installer_servers = require('nvim-lsp-installer.servers')
local null = require('null-ls')
local b = null.builtins

local on_attach = require('art.modules.lsp.on_attach').on_attach

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

local servers = {
    sumneko_lua = {},
    pyright = {},
    dockerls = {},
}

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
		pos = 1,
		prefix = function(diagnostic, i, total)
			local icon, highlight
			if diagnostic.severity == 1 then
				icon = 'E'
			elseif diagnostic.severity == 2 then
				icon = 'W'
				highlight = 'DiagnosticWarn'
			elseif diagnostic.severity == 3 then
				icon = 'I'
				highlight = 'DiagnosticInfo'
			elseif diagnostic.severity == 4 then
				icon = 'H'
				highlight = 'DiagnosticHint'
			end
			return i .. '/' .. total .. ' ' .. icon .. '  ', highlight
		end,
	},
	underline = false,
	signs = {
		enable = true,
		priority = 10,
	},
	update_in_insert = true,
	severity_sort = true,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with({
	vim.lsp.handlers.hover,
	border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with({
	vim.lsp.handlers.signature_help,
	border = 'rounded',
})

local update_capabilities = function(capabilities)
	capabilities.offsetEncoding = { 'utf-16' }
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = update_capabilities(capabilities)

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

install.settings({
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

for _, s in pairs(servers) do
	local ok, lsp_server = installer_servers.get_server(s)
	if ok then
		if not lsp_server:is_installed() then
			print('Installing ' .. s)
			lsp_server:install()
		end
	end
end

install.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = vim.loop.cwd,
		flags = {
			debounce_text_changes = 100,
		},
	}

	if server.name == 'sumneko_lua' then
		opts = require('lua-dev').setup({
			library = { plugins = true, types = true, vimruntime = true },
			lspconfig = {
				runtime = {
					version = 'LuaJIT',
					path = runtime_path,
					vim.fn.expand('~') .. '/.config/nvim/lua/?.lua',
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					maxPreload = 10000,
					preloadFileSize = 1000,
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

local clangd_defaults = require('lspconfig.server_configurations.clangd')
local clangd_configs = vim.tbl_deep_extend('force', clangd_defaults['default_config'], {
	on_attach = on_attach,
	cmd = {
		'clangd',
		'-j=4',
		'--background-index',
		'--clang-tidy',
		'--fallback-style=llvm',
		'--all-scopes-completion',
		'--completion-style=detailed',
		'--header-insertion=iwyu',
		'--header-insertion-decorators',
		'--pch-storage=memory',
	},
})
require('clangd_extensions').setup({
	server = clangd_configs,
})

local sources = {
	b.code_actions.gitrebase,
	b.code_actions.gitsigns,
	b.code_actions.refactoring,
	b.diagnostics.selene.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/selene.toml' } }),
	b.diagnostics.luacheck.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc' } }),
	b.formatting.prettierd,
	b.formatting.stylua.with({ extra_args = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' } }),
}

null.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	debounce = 100,
	debug = true,
	sources = sources,
})
