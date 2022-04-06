require('hover').setup({
	init = function()
		require('hover.providers.lsp')
		require('hover.providers.gh')
		require('hover.providers.man')
		require('hover.providers.dictionary')
	end,
	preview_opts = {
		border = nil,
	},
	title = true,
})

-- Setup keymaps
vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
