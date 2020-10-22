local nvim_lsp = require'nvim_lsp'

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}

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
    on_new_config = <function 1> end
    root_dir = <function 1> end

require'nvim_lsp'.bashls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "bash-language-server", "start" }
    filetypes = { "sh" }
    root_dir = vim's starting directory

require'nvim_lsp'.ccls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "ccls" }
    filetypes = { "c", "cpp", "objc", "objcpp" }
    root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git")

require'nvim_lsp'.cssls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "css-languageserver", "--stdio" }
    filetypes = { "css", "scss", "less" }
    root_dir = root_pattern("package.json")
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }

require'nvim_lsp'.gopls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "gopls" }
    filetypes = { "go", "gomod" }
    root_dir = root_pattern("go.mod", ".git")

require'nvim_lsp'.html.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "html-languageserver", "--stdio" }
    filetypes = { "html" }
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    }
    root_dir = <function 1>
    settings = {}

require'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "vscode-json-languageserver", "--stdio" }
    filetypes = { "json" }
    root_dir = root_pattern(".git", vim.fn.getcwd())

require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "pyls" }
    filetypes = { "python" }
    root_dir = vim's starting directory

require'nvim_lsp'.rls.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "rls" }
    filetypes = { "rust" }
    root_dir = root_pattern("Cargo.toml")

require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "rust-analyzer" }
    filetypes = { "rust" }
    root_dir = root_pattern("Cargo.toml", "rust-project.json")
    settings = {
      ["rust-analyzer"] = {}
    }

require'nvim_lsp'.sumneko_lua.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    filetypes = { "lua" }
    log_level = 2
    root_dir = root_pattern(".git") or os_homedir

require'nvim_lsp'.texlab.setup{on_attach=on_attach_vim}

  Commands:
  - TexlabBuild: Build the current buffer
  
  Default Values:
    cmd = { "texlab" }
    filetypes = { "tex", "bib" }
    root_dir = vim's starting directory
    settings = {
      bibtex = {
        formatting = {
          lineLength = 120
        }
      },
      latex = {
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
          executable = "latexmk",
          onSave = false
        },
        forwardSearch = {
          args = {},
          onSave = false
        },
        lint = {
          onChange = false
        }
      }
    }

require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}

  Commands:
  
  Default Values:
    cmd = { "typescript-language-server", "--stdio" }
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    root_dir = root_pattern("package.json", "tsconfig.json", ".git")
