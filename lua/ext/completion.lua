require('lspkind').init()
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  min_length = 1;
  preselect = 'enable';
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = false;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
