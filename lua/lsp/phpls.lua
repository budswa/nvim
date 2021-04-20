require("lspconfig").intelephense.setup({
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
})
