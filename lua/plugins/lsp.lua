local M = {}

local lsp_install = require('nvim-lsp-installer')
local servers = require('nvim-lsp-installer.servers')
local format_install = require('format-installer')
local null = require('null-ls')
local b = null.builtins

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

local required_servers = {
	'sumneko_lua',
	'vimls',
	'clangd',
}

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
		header = { 'Diagnostics:', 'DiagnosticHeader' },
		pos = 1,
		prefix = function(diagnostic, i, total)
			local icon, highlight
			if diagnostic.severity == 1 then
				icon = 'E'
				highlight = 'DiagnosticError'
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
	underline = true,
	virtual_text = {
		prefix = '⋄',
		spacing = 2,
		severity_limit = 'Warning',
	},
	signs = {
		enable = true,
		priority = 10,
	},
	update_in_insert = true,
	severity_sort = true,
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
	require('keymaps').lsp_on_attach(bufnr)

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
	vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

	require('lsp_signature').on_attach({
		bind = true,
		hint_prefix = '⋉ ',
		handler_opts = { border = 'rounded' },
	}, bufnr)
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lsp_install.settings({
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

lsp_install.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = M.on_attach,
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

local sources = {
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
	b.diagnostics.vale,
	--b.formatting.black,
	b.formatting.clang_format,
	b.formatting.gofmt,
	b.formatting.markdownlint,
	b.formatting.prettierd,
	b.formatting.rustfmt,
	b.formatting.stylua,
}

for _, formatter in ipairs(format_install.get_installed_formatters()) do
	local config = { command = formatter.cmd }

	-- Passes extra_args into null-ls configurations
	if formatter.name == 'stylua' then
		config['extra_args'] = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' }
	elseif formatter.name == '' then
		config['extra_args'] = { '--config', vim.fn.stdpath('config') .. '/selene.toml' }
	end

	table.insert(sources, null.builtins.formatting[formatter.name].with(config))
end

null.setup({
	on_attach = M.on_attach,
	capabilities = capabilities,
	debounce = 100,
	debug = true,
	sources = sources,
})

return M
