local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')



require('cmp_nvim_lsp').setup()
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
})

cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
			.. ' ' .. vim_item.kind

			vim_item.menu = ({
        nvim_lsp = '[LSP]',
				treesitter = '[TS]',
        nvim_lua = '[Lua]',
        path   = '[Path]',
        buffer = '[Buffer]',
        calc   = '[Calc]',
				luasnip = '[LuaSnip]',
      }) [entry.source.name]

      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
  },
  sources = {
    { name = 'nvim_lsp' },
		{ name = 'treesitter' },
    { name = 'path' },
    { name = 'buffer' },
		{ name = 'calc' },
    { name = 'luasniip' },
  },
}
