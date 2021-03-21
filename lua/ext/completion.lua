require("lspkind").init()
require("compe").setup({
	enabled = true,
	autocomplete = true,
	min_length = 0,
	preselect = "enable",
	documentation = true,

	source = {
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
		spell = false,
		tags = true,
		vsnip = true;
		treesitter = true,
	},
})
