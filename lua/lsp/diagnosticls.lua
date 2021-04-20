require'lspconfig'.diagnosticls.setup{
cmd = {'diagnostic-languageserver', '--stdio'},
  filetypes = {'lua', 'bzl', 'sh', 'markdown', 'yaml', 'json', 'jsonc'},
}
