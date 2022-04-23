local M = {}

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

	local map = vim.keymap.set
	local opts = { buffer = bufnr, silent = true, noremap = true }

	map('n', '<c-k>', function()
		vim.lsp.buf.signature_help()
	end, opts)
	map('n', 'g0', function()
		vim.lsp.buf.document_symbol()
	end, opts)
	map('n', 'gi', function()
		vim.lsp.buf.implementation()
	end, opts)
	map('n', 'gD', function()
		vim.lsp.buf.declaration()
	end, opts)
	map('n', 'gd', function()
		vim.lsp.buf.definition()
	end, opts)
	map('n', 'gr', function()
		vim.lsp.buf.references()
	end, opts)

	require('which-key').register({
		['<leader>'] = {
			l = {
				name = '[LSP]',
				d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition' },
				D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
				i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Show implementation' },
				r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol' },
				R = { '<cmd>lua vim.lsp.buf.references()<cr>', 'Show references' },
				t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Show type definition' },
				f = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Diagnostics open float' },
				a = { '<cmd>CodeActionMenu<cr>', 'Code action' },
				A = { '<cmd>Telescope lsp_range_code_actions<cr>', 'Range code action' },
				s = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Workspace symbols' },
				S = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document symbols' },
				w = {
					name = '[Workspace]',
					l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'Workspace list' },
					a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Workspace add' },
					r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Workspace remove' },
				},
			},
		},
	})

	require('lsp-format').on_attach(client)
	require('lsp_signature').on_attach({
		bind = true,
		max_height = 12,
		max_width = 120,
		transpancy = 20,
		hint_prefix = '⋉ ',
		handler_opts = { border = 'rounded' },
	}, bufnr)

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_create_augroup('lsp', {})
		vim.api.nvim_create_autocmd('CursorHold', {
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
			buffer = bufnr,
			group = 'lsp',
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			buffer = bufnr,
			group = 'lsp',
		})
	end
end

return M
