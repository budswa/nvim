local cmp = require('cmp')
local autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

require('lsp_signature').setup({
	bind = true,
	max_height = 12,
	max_width = 120,
	transpancy = 10,
	handler_opts = {
		border = 'single',
	},
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

require('cmp_nvim_lsp').setup()
cmp.setup({
	completion = {
		completeopt = 'menu,menuone,preview,noinsert',
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind

			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				nvim_lua = '[Lua]',
				luasnip = '[LuaSnip]',
				treesitter = '[TS]',
				path = '[Path]',
				buffer = '[Buffer]',
				tags = '[Tags]',
				calc = '[Calc]',
				rg = '[Rg]',
			})[entry.source.name]

			return vim_item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		['<Right>'] = cmp.mapping(function(fallback)
			local copilot_keys = vim.fn['copilot#Accept']()
			if copilot_keys ~= '' then
				vim.api.nvim_feedkeys(copilot_keys, 'i', true)
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
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

cmp.setup.cmdline(':', {
	sources = {
		{ name = 'cmdline' },
	},
})
cmp.setup.cmdline('/', {
	sources = cmp.config.sources({
		{ name = 'nvim_lsp_document_symbol' },
	}, {
		{ name = 'buffer' },
	}),
})

require('nvim-autopairs').setup()
cmp.event:on( 'confirm_done', autopairs.on_confirm_done({  map_char = { tex = '' } }))
