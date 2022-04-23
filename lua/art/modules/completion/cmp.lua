local cmp = require('cmp')
local types = require('cmp.types')
local lspkind = require('lspkind')
local autopairs = require('nvim-autopairs.completion.cmp')
local luasnip = require('luasnip')
local neogen = require('neogen')

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

require('cmp_nvim_lsp').setup()

cmp.setup({
	completion = {
		autocomplete = { types.cmp.TriggerEvent.TextChanged },
		scrollbar = '┃',
		completeopt = 'menu,menuone,preview',
		--completeopt = 'menu,menuone,preview,noinsert,select',
		keyword_length = 1,
	},
	window = {
		completion = { border = border, scrollbar = '┃' },
		documentation = { border = border, scrollbar = '┃' },
	},
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				luasnip = '[Snip]',
				copilot = '[CP]',
				nvim_lsp = '[LSP]',
				nvim_lua = '[Lua]',
				path = '[Path]',
				buffer = '[Buf]',
				treesitter = '[TS]',
				rg = '[Rg]',
			},
		}),
	},
	enabled = function()
		if vim.bo.ft == 'TelescopePrompt' then
			return false
		end
		return true
	end,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<cr>'] = cmp.mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif cmp.visible() then
				cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert })
			else
				fallback()
			end
		end, { 'i', 'c' }),
		['<c-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<c-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
		['<c-d>'] = cmp.mapping.scroll_docs(-4),
		['<c-f>'] = cmp.mapping.scroll_docs(4),
		['<c-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.choice_active() then
				luasnip.change_choice(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<c-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.choice_active() then
				luasnip.change_choice(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<c-l>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif neogen.jumpable() then
				neogen.jump_next()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<c-h>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			elseif neogen.jumpable(-1) then
				neogen.jump_prev()
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'luasnip', priority = 5 },
		{ name = 'copilot', priority = 4 },
		{ name = 'nvim_lsp', priority = 4 },
		{ name = 'nvim_lua', priority = 3 },
		{ name = 'path', priority = 3 },
		{ name = 'buffer', priority = 2 },
		{ name = 'treesitter', priority = 1 },
		{ name = 'rg', priority = 1 },
		{ name = 'nvim_lsp_signature_help', priority = 10 },
	},
	experimental = { ghost_text = true },
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
		{ name = 'buffer' },
	}),
})

cmp.setup.cmdline(':', {
	enabled = true,
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	}),
	window = {
		completion = {
			border = border,
			scrollbar = '▌',
		},
		documentation = {
			border = border,
			scrollbar = '▌',
		},
	},
	--view = {
	--    entries = { name = 'wildmenu', separator = ' | ' },
	--},
})

cmp.setup.cmdline('/', {
	enabled = true,
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer', keyword_length = 1 },
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
	--view = {
	--    entries = { name = 'wildmenu', separator = ' | ' },
	--},
})

cmp.event:on('confirm_done', autopairs.on_confirm_done({ map_char = { tex = '' } }))
