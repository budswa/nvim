local lspconfig = require('lspconfig')

local required_servers = {
	'sumneko_lua',
	'pyright',
	'yamlls',
	'jsonls',
	'vimls',
}

vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E', numhl = 'LspDiagnosticsDefaultError' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W', numhl = 'LspDiagnosticsDefaultWarning' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'I', numhl = 'LspDiagnosticsDefaultInformation' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H', numhl = 'LspDiagnosticsDefaultHint' })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { 'documentation', 'detail', 'additionalTextEdits' },
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = true,
	signs = {
		enable = true,
		priority = 10,
	},
	update_in_insert = true,
})

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local function setup_lsp()
	local lsp_installer = require('nvim-lsp-installer')
	local servers = require("nvim-lsp-installer.servers")

	lsp_installer.settings({
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	})

	-- Install missing servers
	for _, svr in pairs(required_servers) do
		local ok, lsp_server = servers.get_server(svr)
		if ok then
			if not lsp_server:is_installed() then
				lsp_server:install()
			end
		end
	end

	lsp_installer.on_server_ready(function(server)
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = vim.loop.cwd,
		}

		if server.name == "sumneko_lua" then
			local luadev = require('lua-dev').setup({
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
			server:setup(luadev)
		else
			server:setup(opts)
		end
	end)
end

local function setup_null_ls()
	local null = require('null-ls')

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
end

setup_lsp()
setup_null_ls()
