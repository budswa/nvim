local cmp = require('cmp')
local types = require('cmp.types')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local neogen = require('neogen')
local t = require('utils').termcode

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

require('cmp_nvim_lsp').setup()

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
			autocomplete = { types.cmp.TriggerEvent.InsertEnter, types.cmp.TriggerEvent.TextChanged },
		},
		documentation = { border = border, scrollbar = '┃' },
	},
	formatting = {
		fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
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
		--['<cr>'] = cmp.mapping.confirm({ select = false }),
		['<cr>'] = cmp.mapping(function(_)
			if not cmp.confirm({ select = false }) then
				require('pairs.enter').type()
			end
		end),
		['<c-space>'] = cmp.mapping.complete(),
		['<c-c>'] = cmp.mapping.close(),
		['<c-y>'] = cmp.config.disable,
		['<c-d>'] = cmp.mapping.scroll_docs(-4),
		['<c-f>'] = cmp.mapping.scroll_docs(4),
		--['<c-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }, { 'i', 's', 'c' }),
		['<c-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.choice_active() then
				luasnip.change_choice(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		--['<c-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }, { 'i', 's', 'c' }),
		['<c-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			elseif luasnip.choice_active() then
				luasnip.change_choice(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-l>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(t('<plug>luasnip-expand-or-jump'), '')
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
	experimental = { ghost_text = true, native_menu = false },
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

cmp.event:on('confirm_done', function(event)
	local item = event.entry:get_completion_item()
	local parensDisabled = item.data and item.data.funcParensDisabled or false
	if
		not parensDisabled
		and (
			item.kind == cmp.lsp.CompletionItemKind.Method
			or cmp.lsp.CompletionItemKind.kind == cmp.lsp.CompletionItemKind.Function
		)
	then
		require('pairs.bracket').type_left('(')
	end
end)
