local nvim_lsp = require('nvim_lsp')

local servers = {'vimls', 'sumneko_lua', 'pyls', 'gopls'}

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
}
end
