local nvim_lsp = require'nvim_lsp'

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}

  Commands:

  Default Values:
    cmd = { "vim-language-server", "--stdio" }
    filetypes = { "vim" }
    init_options = {
      diagnostic = {
        enable = true
      },
      indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
        runtimepath = true
      },
      suggest = {
        fromRuntimepath = true,
        fromVimruntime = true
      },
      vimruntime = "
    }
