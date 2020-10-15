require'nvim_lsp'.vimls.setup{}
  Commands:
  Default Values:
    cmd = { "vim-language-server", "--stdio" }
    docs = {
      description = ""
    }
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
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
        fromRuntimepath = true,
        fromVimruntime = true
      },
      vimruntime = ""
    }
    on_new_config = <function 1>
    root_dir = <function 1>
