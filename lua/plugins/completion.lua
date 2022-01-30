local cmp = require('cmp')
local types = require('cmp.types')
local str = require('cmp.utils.str')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local luasnip_types = require('luasnip.util.types')
local neogen = require('neogen')

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

local t = function(s)
	return vim.api.nvim_replace_termcodes(s, true, true, true)
end

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

luasnip.config.setup({
	region_check_events = 'CursorMoved',
	delete_check_events = 'TextChanged',
	ext_opts = {
		[luasnip_types.choiceNode] = {
			active = {
				virt_text = { { '●', 'Boolean' } },
			},
		},
		[luasnip_types.insertNode] = {
			active = {
				virt_text = { { '●', 'function' } },
			},
		},
	},
})

require('lsp_signature').setup({
	bind = true,
	max_height = 12,
	max_width = 120,
	transpancy = 20,
	handler_opts = { border = 'rounded' },
	hint_prefix = ' ',
})

require('luasnip.loaders.from_vscode').load()

cmp.setup({
	completion = {
		border = border,
		scrollbar = '┃',
		completeopt = 'menu,menuone,preview,noinsert,select',
		keyword_length = 1,
	},
	window = {
		completion = {
			border = border,
			scrollbar = '┃',
		},
		documentation = {
			border = border,
			scrollbar = '┃',
		},
	},
	formatting = {
		fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				git = '[Git]',
				copilot = '[CP]',
				luasnip = '[Snip]',
				path = '[Path]',
				calc = '[Calc]',
				nvim_lua = '[Lua]',
				nvim_lsp = '[LSP]',
				buffer = '[Buf]',
				treesitter = '[TS]',
				rg = '[Rg]',
			},
			before = function(entry, vim_item)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end
				word = str.oneline(word)

				--local max = 50
				--if string.len(word) >= max then
				--	local before = string.sub(word, 1, math.floor((max - 3) / 2))
				--	word = before .. '...'
				--end

				if
					entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
					and string.sub(vim_item.abbr, -1, -1) == '~'
				then
					word = word .. '~'
				end
				vim_item.abbr = word

				--vim_item.dup = ({
				--	buffer = 1,
				--	path = 1,
				--	nvim_lsp = 0,
				--})[entry.source.name] or 0

				return vim_item
			end,
		}),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-l>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
			elseif neogen.jumpable() then
				vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), '')
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-h>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
			elseif neogen.jumpable(-1) then
				vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_prev()<CR>"), '')
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.config.disable,
	},
	sources = {
		{ name = 'cmp_git' },
		{ name = 'copilot' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'treesitter' },
		{ name = 'rg' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'neorg' },
	},
	experimental = {
		ghost_text = true,
		--native_menu = false,
	},
})

cmp.setup.cmdline(':', {
	enabled = function()
		return true
	end,
	completion = {
		border = border,
		scrollbar = '▌',
	},
	documentation = {
		border = border,
		scrollbar = '▌',
	},
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

require('cmp_git').setup()
require('cmp_nvim_lsp').setup()

cmp.setup.cmdline('/', {
	enabled = function()
		return true
	end,
	sources = {
		{ name = 'buffer', keyword_length = 1 },
	},
	completion = {
		border = border,
		scrollbar = '┃',
	},
	documentation = {
		border = border,
		scrollbar = '┃',
	},
})