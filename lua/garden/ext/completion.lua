local cmp = require('cmp')
local types = require('cmp.types')
local str = require('cmp.utils.str')
local autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''

--require('luasnip/loaders/from_vscode').lazy_load()
require('luasnip/loaders/from_vscode').load()

require('nvim-autopairs').setup({
	disable_filetype = { 'TelescopePrompt' },
	check_ts = true,
})
cmp.event:on('confirm_done', autopairs.on_confirm_done({ map_char = { tex = '' } }))

require('cmp_nvim_lsp').setup()
cmp.setup({
	completion = {
		--border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
		--scrollbar = '║',
		completeopt = 'menu,menuone,preview,noinsert',
		keyword_length = 1,
	},
	documentation = {
		border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
		scrollbar = '║',
	},
	--formatting = {
	--	format = lspkind.cmp_format({
	--		with_text = true,
	--		menu = {
	--			copilot = '[CP]',
	--			luasnip = '[Snip]',
	--			path = '[Path]',
	--			calc = '[Calc]',
	--			nvim_lua = '[Lua]',
	--			nvim_lsp = '[LSP]',
	--			buffer = '[Buffer]',
	--			treesitter = '[TS]',
	--			rg = '[Rg]',
	--		},
	--	}),
	--},
	formatting = {
		fields = {
			cmp.ItemField.Kind,
			cmp.ItemField.Abbr,
			cmp.ItemField.Menu,
		},
		format = lspkind.cmp_format({
			with_text = false,
			menu = {
				copilot = '[CP]',
				luasnip = '[Snip]',
				path = '[Path]',
				calc = '[Calc]',
				nvim_lua = '[Lua]',
				nvim_lsp = '[LSP]',
				buffer = '[Buffer]',
				treesitter = '[TS]',
				rg = '[Rg]',
			},
			before = function(entry, vim_item)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end
				word = str.oneline(word)

				if
					entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
					and string.sub(vim_item.abbr, -1, -1) == '~'
				then
					word = word .. '~'
				end
				vim_item.abbr = word

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
		['<C-y>'] = cmp.config.disable,
		['<C-e>'] = cmp.mapping.abort(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
	},
	sources = {
		{ name = 'copilot' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'treesitter' },
		{ name = 'rg' },
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})
