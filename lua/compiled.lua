-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/eliemanuel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/eliemanuel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/eliemanuel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/eliemanuel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/eliemanuel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["clangd_extensions.nvim"] = {
    config = { "\27LJ\2\n¯\2\0\0\a\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\0036\4\0\0'\6\3\0B\4\2\0029\4\6\4=\4\6\0035\4\a\0=\4\b\3=\3\n\2B\0\2\1K\0\1\0\vserver\1\0\0\bcmd\1\v\0\0\vclangd\t-j=8\23--background-index\17--clang-tidy\26--fallback-style=llvm\28--all-scopes-completion --completion-style=detailed\28--header-insertion=iwyu\"--header-insertion-decorators\25--pch-storage=memory\17capabilities\1\0\0\14on_attach\20art.plugins.lsp\nsetup\22clangd_extensions\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-under-comparator"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["comment.nvim"] = {
    config = { "\27LJ\2\ns\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\ftoggler\1\0\2\nblock\bgbc\tline\bgcc\1\0\2\fpadding\1\vsticky\2\nsetup\fcomment\frequire\0" },
    keys = { { "v", "gc" }, { "v", "gb" }, { "n", "gcc" }, { "n", "gcb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/comment.nvim",
    url = "https://github.com/numtostr/comment.nvim"
  },
  ["dim.lua"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/dim.lua",
    url = "https://github.com/narutoxy/dim.lua"
  },
  ["editorconfig.nvim"] = {
    cond = { "\27LJ\2\ny\0\0\5\0\a\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\3\0029\2\4\2'\4\5\0B\2\2\2'\3\6\0&\2\3\2B\0\2\2\15\0\0\0X\1\2Ä+\0\2\0L\0\2\0K\0\1\0\19/.editorconfig\vconfig\fstdpath\afn\ffs_stat\tloop\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["formatter.nvim"] = {
    commands = { "FormatWrite" },
    config = { "\27LJ\2\n˘\2\0\0\b\0\19\0,6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\17\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5>\5\1\4=\4\6\0034\4\3\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5>\5\1\4=\4\t\0034\4\3\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5>\5\1\4=\4\n\0034\4\3\0006\5\0\0'\a\v\0B\5\2\0029\5\f\5>\5\1\4=\4\r\0034\4\3\0006\5\0\0'\a\14\0B\5\2\0029\5\15\5>\5\1\4=\4\16\3=\3\18\2B\0\2\1K\0\1\0\rfiletype\1\0\0\trust\frustfmt\29formatter.filetypes.rust\vpython\nblack\31formatter.filetypes.python\bcpp\6c\16clangformat\28formatter.filetypes.cpp\blua\1\0\0\vstylua\28formatter.filetypes.lua\nsetup\14formatter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    load_after = {
      luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    cond = { "\27LJ\2\nv\0\0\6\0\b\0\0186\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3'\5\5\0B\3\2\2'\4\6\0&\3\4\3B\0\3\2\a\0\a\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\5\6;\n%:p:h\vexpand\f.git/..\ffinddir\afn\bvim\0" },
    config = { "\27LJ\2\n≈\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\2\nnumhl\1\15signcolumn\2\17changedelete\1\0\2\ahl\19GitSignsChange\ttext\b‚ñè\14topdelete\1\0\2\ahl\19GitSignsDelete\ttext\b‚ñî\vdelete\1\0\2\ahl\19GitSignsDelete\ttext\b‚ñÅ\vchange\1\0\2\ahl\19GitSignsChange\ttext\b‚ñè\badd\1\0\0\1\0\2\ahl\16GitSignsAdd\ttext\b‚ñè\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n”\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a\tchar\b‚ñè\17context_char\b‚ñè\25show_current_context\2\31show_current_context_start\2\19use_treesitter\2#show_trailing_blankline_indent\1\20viewport_buffer\3\b\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    keys = { { "", "S" }, { "", "s" }, { "", "f" }, { "", "F" }, { "", "t" }, { "", "T" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp-command"] = {
    after_files = { "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/lsp-command/after/plugin/lspcommand.vim" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/lsp-command",
    url = "https://github.com/ii14/lsp-command"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nÑ\2\0\0\a\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4B\4\1\2=\4\5\3=\3\a\2B\0\2\1K\0\1\0\17handler_opts\1\0\0\vborder\14art.utils\1\0\t\16hint_prefix\tÔÅö \16hint_enable\2\tbind\2\16hint_scheme\vString\17hi_parameter\15TSEmphasis\fpadding\b‚ñè\14doc_lines\3\0\20floating_window\2\ffix_pos\2\nsetup\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  luasnip = {
    after = { "friendly-snippets" },
    config = { "\27LJ\2\nÃ\1\0\0\3\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\tload luasnip.loaders.from_vscode\1\0\3\fhistory\2\17updateevents)TextChanged,TextChangedI,InsertLeave\24enable_autosnippets\2\nsetup\vconfig\fluasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/luasnip",
    url = "https://github.com/l3mon4d3/luasnip"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmodes\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-under-comparator", "nvim-autopairs", "cmp-nvim-lsp", "cmp-cmdline", "cmp-nvim-lua", "cmp-path", "cmp_luasnip", "luasnip", "cmp-buffer", "cmp-nvim-lsp-signature-help" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27art.plugins.completion\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerAttachToBuffer" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-colorizer.lua",
    url = "https://github.com/xiyaowong/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp-command" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20art.plugins.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-semantic-tokens"] = {
    config = { "\27LJ\2\n™\1\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0006\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\17highlighters+nvim-semantic-tokens.table-highlighter\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\3ÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-semantic-tokens",
    url = "https://github.com/theHamsta/nvim-semantic-tokens"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-refactor", "nvim-treesitter-context", "dim.lua", "hlargs.nvim", "nvim-treesitter-textobjects", "nvim-ts-rainbow", "playground" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27art.plugins.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-treesitter-endwise",
    url = "https://github.com/rrethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["paperplanes.nvim"] = {
    commands = { "PP" },
    config = { "\27LJ\2\n]\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\rregister\6+\rprovider\rpaste.rs\nsetup\16paperplanes\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/paperplanes.nvim",
    url = "https://github.com/rktjmp/paperplanes.nvim"
  },
  playground = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\n†\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\0036\4\0\0'\6\3\0B\4\2\0029\4\6\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\vserver\1\0\0\17capabilities\1\0\0\14on_attach\20art.plugins.lsp\nsetup\15rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm" },
    config = { "\27LJ\2\n‡\2\0\0\a\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4B\4\1\2=\4\5\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\16NormalFloat\vborder\16FloatBorder\1\0\1\rwinblend\3\0\vborder\14art.utils\1\0\t\20insert_mappings\2\17open_mapping\n<c-t>\20shade_terminals\2\19shading_factor\0063\17persist_size\2\18close_on_exit\1\14direction\15horizontal\17hide_numbers\2\20start_in_insert\2\nsetup\15toggleterm\frequire\0" },
    keys = { { "", "<c-t>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/eliemanuel/.local/share/nvim/site/pack/art/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp",
  ["^cmp%-under%-comparator"] = "cmp-under-comparator",
  ["^cmp_nvim_lsp"] = "cmp-nvim-lsp",
  ["^comment"] = "comment.nvim",
  ["^lua%-dev"] = "lua-dev.nvim",
  ["^luasnip"] = "luasnip",
  ["^neogen"] = "neogen",
  ["^nvim%-autopairs%.completion%.cmp"] = "nvim-autopairs",
  ["^nvim%-surround"] = "nvim-surround",
  ["^plenary"] = "plenary.nvim",
  ["^telescope"] = "telescope.nvim",
  ["^toggleterm"] = "toggleterm.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: formatter.nvim
time([[Setup for formatter.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\16FormatWrite\bcmd\bvimû\1\1\0\b\0\n\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\5\0003\4\4\0=\4\6\0036\4\0\0009\4\1\0049\4\a\4'\6\b\0004\a\0\0B\4\3\2=\4\t\3B\0\3\1K\0\1\0\ngroup\vformat\24nvim_create_augroup\rcallback\1\0\0\0\17BufWritePost\24nvim_create_autocmd\bapi\bvim\0", "setup", "formatter.nvim")
time([[Setup for formatter.nvim]], false)
-- Setup for: gitsigns.nvim
time([[Setup for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18gitsigns.nvim\vloader\vpacker\frequire2\1\2\5\0\3\1\a\t\0\0\0X\2\4Ä6\2\0\0009\2\1\0023\4\2\0B\2\2\1K\0\1\0\0\rschedule\bvim\0ﬁ\1\1\0\n\0\14\1\0283\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0)\4\0\0)\5ˇˇ+\6\1\0B\1\5\0025\2\4\0\4\1\2\0X\2\15Ä6\2\1\0009\2\5\0029\2\6\2'\4\a\0005\5\f\0005\6\b\0006\a\1\0009\a\t\a9\a\n\a'\t\v\0B\a\2\0?\a\0\0=\6\r\5\18\6\0\0B\2\4\1K\0\1\0\targs\1\0\0\6%\vexpand\afn\1\3\0\0\rls-files\20--error-unmatch\bgit\nspawn\tloop\1\2\0\0\5\23nvim_buf_get_lines\bapi\bvim\0\aÄÄ¿ô\4h\1\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3B\0\3\1K\0\1\0\rcallback\1\0\0\0\1\3\0\0\vBufAdd\rVimEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "gitsigns.nvim")
time([[Setup for gitsigns.nvim]], false)
-- Setup for: modes.nvim
time([[Setup for modes.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15modes.nvim\vloader\vpacker\frequire)\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\rschedule\bvim\0", "setup", "modes.nvim")
time([[Setup for modes.nvim]], false)
-- Setup for: nvim-treesitter-endwise
time([[Setup for nvim-treesitter-endwise]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\4\0\t\0\0166\0\0\0009\0\1\0005\2\2\0006\3\0\0009\3\3\0039\3\4\3B\0\3\2\15\0\0\0X\1\6Ä6\0\5\0'\2\6\0B\0\2\0029\0\a\0'\2\b\0B\0\2\1K\0\1\0\28nvim-treesitter-endwise\vloader\vpacker\frequire\aft\abo\1\5\0\0\blua\bvim\tbash\truby\17tbl_contains\bvim®\1\1\0\b\0\n\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\6\0006\4\0\0009\4\1\0049\4\4\4'\6\5\0004\a\0\0B\4\3\2=\4\a\0033\4\b\0=\4\t\3B\0\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\22tresitter-endwise\24nvim_create_augroup\16InsertEnter\24nvim_create_autocmd\bapi\bvim\0", "setup", "nvim-treesitter-endwise")
time([[Setup for nvim-treesitter-endwise]], false)
-- Conditional loads
time([[Conditional loading of editorconfig.nvim]], true)
  require("packer.load")({"editorconfig.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of editorconfig.nvim]], false)
time([[Conditional loading of gitsigns.nvim]], true)
  require("packer.load")({"gitsigns.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of gitsigns.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'formatter.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'toggleterm.nvim'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PP lua require("packer.load")({'paperplanes.nvim'}, { cmd = "PP", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerAttachToBuffer lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerAttachToBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gcb <cmd>lua require("packer.load")({'comment.nvim'}, { keys = "gcb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gc <cmd>lua require("packer.load")({'comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gcc <cmd>lua require("packer.load")({'comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> S <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gb <cmd>lua require("packer.load")({'comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-t> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>c-t>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'neogen', 'rust-tools.nvim', 'nvim-lspconfig', 'nvim-treesitter'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType make ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "make" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'neogen', 'lua-dev.nvim', 'nvim-lspconfig', 'nvim-treesitter'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType nix ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "nix" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'neogen', 'nvim-lspconfig', 'nvim-treesitter'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'neogen', 'clangd_extensions.nvim', 'nvim-lspconfig', 'nvim-treesitter'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType help ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "help" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'neogen', 'clangd_extensions.nvim', 'nvim-lspconfig', 'nvim-treesitter'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType scheme ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "scheme" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'neogen', 'nvim-lspconfig'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'neogen', 'nvim-lspconfig', 'nvim-treesitter'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType julia ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "julia" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au LspAttach * ++once lua require("packer.load")({'nvim-semantic-tokens', 'lsp_signature.nvim'}, { event = "LspAttach *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'indent-blankline.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdLineEnter * ++once lua require("packer.load")({'nvim-autopairs', 'nvim-cmp'}, { event = "CmdLineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'luasnip', 'nvim-cmp', 'friendly-snippets'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
