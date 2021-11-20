local cmp = require('cmp')
local autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

require('lsp_signature').setup({
	bind = true,
	max_height = 12,
	max_width = 120,
	transpancy = 20,
	handler_opts = { border = 'single' },
})

require('cmp_nvim_lsp').setup()
cmp.setup({
	completion = {
		completeopt = 'menu,menuone,preview,noinsert',

	},
	formatting = {
		format = lspkind.cmp_format({with_text = true, menu = ({
			nvim_lsp = '[LSP]',
			nvim_lua = '[Lua]',
			luasnip = '[Snip]',
			treesitter = '[TS]',
			path = '[Path]',
			buffer = '[Buffer]',
			tags = '[Tags]',
			calc = '[Calc]',
			rg = '[Rg]',
		})})
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-y>'] = cmp.config.disable,
		['<C-e>'] = cmp.mapping.abort(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'treesitter' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'tags' },
		{ name = 'calc' },
		{ name = 'rg' },
	},
})

require('nvim-autopairs').setup()
cmp.event:on('confirm_done', autopairs.on_confirm_done({ map_char = { tex = '' } }))
