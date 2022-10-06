require("art.colors").set("lsp")

local function on_attach(client, bufnr)
	local function map(mode, lhs, rhs, options)
		vim.keymap.set(
			mode,
			lhs,
			rhs,
			vim.tbl_deep_extend("force", { buffer = bufnr, silent = true, noremap = true }, options)
		)
	end

	map("n", "<c-k>", function()
		vim.lsp.buf.signature_help()
	end, {})
	map("n", "g0", function()
		vim.lsp.buf.document_symbol()
	end, {})
	map("n", "gi", function()
		vim.lsp.buf.implementation()
	end, {})
	map("n", "gD", function()
		vim.lsp.buf.declaration()
	end, {})
	map("n", "gd", function()
		vim.lsp.buf.definition()
	end, {})
	map("n", "gr", function()
		vim.lsp.buf.references()
	end, {})
	map("n", "<leader>ld", function()
		vim.lsp.buf.definition()
	end, {})

	if client.server_capabilities.completionProvider then
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	end

	if client.server_capabilities.definitionProvider then
		vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
	end

	if client.server_capabilities.formatProvider then
		vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
	end

	vim.api.nvim_create_augroup("lsp", {})
	if client.server_capabilities.semanticTokensProvider and client.server_capabilities.semanticTokensProvider.full then
		vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged" }, {
			group = vim.api.nvim_create_augroup("SemanticTokens", {}),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.semantic_tokens_full()
			end,
		})
		vim.lsp.buf.semantic_tokens_full()
	end

	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
			buffer = bufnr,
			group = "lsp",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			buffer = bufnr,
			group = "lsp",
		})
	end
end

local capabilities = {
	offsetEncoding = { "utf-16" },
	textDocument = {
		completion = {
			completionItem = {
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				snippetSupport = true,
				resolveSupport = {
					properties = { "documentation", "detail", "additionalTextEdits" },
				},
			},
		},
		codeAction = {
			dynamicRegistration = false,
			codeActionLiteralSupport = {
				codeActionKind = {
					valueSet = {
						"",
						"quickfix",
						"refactor",
						"refactor.extract",
						"refactor.inline",
						"refactor.rewrite",
						"source",
						"source.organizeImports",
					},
				},
			},
		},
	},
}

vim.diagnostic.config({
	float = {
		focusable = false,
		border = require("art.utils").border(),
		scope = "cursor",
		header = { "Diagnostic", "DiagnosticHeader" },
	},
	underline = false,
	signs = {
		enable = true,
		priority = 10,
	},
	virtual_text = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with({
	vim.lsp.handlers.signature_help,
	border = "rounded",
})

--vim.api.nvim_create_autocmd('CursorHold', {
--    callback = vim.diagnostic.open_float,
--    group = vim.api.nvim_create_augroup('lsp', {}),
--})

local servers = {
	"sumneko_lua",
	"pyright",
	"bashls",
	"gopls",
	"julials",
	"zls",
}

-- sumneko_lua, clangd and rust_analyzer setup themeselves
for _, server in ipairs(servers) do
	require("lspconfig")[server].setup(
		vim.tbl_deep_extend(
			"force",
			{
				on_attach = on_attach,
				capabilities = capabilities,
			},
			vim.loop.fs_stat(vim.fn.stdpath("config") .. "/lua/art/plugins/lsp/servers/" .. server .. ".lua") ~= nil
					and require("art.plugins.lsp.servers." .. server)
				or {}
		)
	)
end
