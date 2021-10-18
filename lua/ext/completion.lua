local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

require "lsp_signature".setup({
  bind = true,
  max_height = 12,
  max_width = 120,
  transpancy = 10,
  handler_opts = {
    border = "single"
  }
})

require('cmp_nvim_lsp').setup()
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
})

cmp.setup{
  completion = {
    completeopt = 'menu,menuone,preview,noinsert'
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
			.. ' ' .. vim_item.kind

			vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
				luasnip = '[LuaSnip]',
				treesitter = '[TS]',
        path   = '[Path]',
        buffer = '[Buffer]',
        tags = '[Tags]',
        calc   = '[Calc]',
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
		{ name = 'nvim_lua' },
    { name = 'luasnip' },
		{ name = 'treesitter' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'tags' },
		{ name = 'calc' },
  }
}
