local nvim_lsp = require('lspconfig')

local servers = {'vimls','ccls','bashls'}

local on_attach_vim = function(client)
require'completion'.on_attach(client)
end
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach_vim,
}
end
