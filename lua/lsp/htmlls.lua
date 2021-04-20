require("lspconfig").html.setup({
	cmd = { "html-languageserver", "--stdio" },
	filetypes = { "html", "php" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
})

