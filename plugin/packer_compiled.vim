" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  ["ISuckAtSpelling.nvim"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/isas\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/ISuckAtSpelling.nvim"
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fext/zen\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["architext.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/architext.nvim"
  },
  ["artify.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/artify.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15ext/barbar\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/clever-f.vim"
  },
  ["codeql.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/codeql.nvim"
  },
  ["crazy-node-movement"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/crazy-node-movement"
  },
  ["dash.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/dash.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/dashboard\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/diffview\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["faster.nvim"] = {
    config = { "\27LJ\2\n½\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\1\vsilent\2\26<Plug>(faster_move_k)\6k\1\0\2\fnoremap\1\vsilent\2\26<Plug>(faster_move_j)\6j\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/faster.nvim"
  },
  ["filetypext.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/filetypext.nvim"
  },
  ["foldsigns.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14foldsigns\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/foldsigns.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15ext/format\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/fzy-lua-native"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/galaxyline\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14ext/blame\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["git-worktree.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/worktree\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/gitlinker\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/gitsigns\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20ext/indentlines\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["instant.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/instant.nvim"
  },
  ["iswap.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/iswap.nvim"
  },
  ["jumpwire.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/jumpwire\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/jumpwire.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/kommentary\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-rooter.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16ext/trouble\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["manillua.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/manillua.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nlua.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/nlua.nvim"
  },
  ["nrpattern.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nrpattern.nvim"
  },
  ["nsync.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nsync.nvim"
  },
  ["ntangle-lsp.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/ntangle-lsp.nvim"
  },
  ["ntangle-ts.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/ntangle-ts.nvim"
  },
  ["ntangle.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/ntangle.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/autopairs\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-biscuits"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/biscuits\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-biscuits"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/colorizer\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/completion\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fext/dap\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-fzy"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-fzy"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16ext/hlslens\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-jqx"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-jqx"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lastplace"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/lint\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lint"
  },
  ["nvim-lsp-smag"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lsp-smag"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-luadev"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-luadev"
  },
  ["nvim-miniyank"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-miniyank"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/nvimtree\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/treesitter\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvimpager = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvimpager"
  },
  nvimtool = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/nvimtool"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/presence\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["qedit.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/qedit.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim"
  },
  ["shade.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14ext/shade\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/shade.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/sniprun"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20ext/spellsitter\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-arecibo.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\farecibo\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-arecibo.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15fzy_native\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17lsp_handlers\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/telescope\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/todo\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/m2/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim"
  },
  ["train.nvim"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/train.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/undotree\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vgit.nvim"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/vgit\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vgit.nvim"
  },
  ["vim-apm"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vim-apm"
  },
  ["vim-hardtime"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vim-hardtime"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/snippets\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/whichkey\frequire\0" },
    loaded = true,
    path = "/home/m2/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: undotree
time("Config for undotree", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/undotree\frequire\0", "config", "undotree")
time("Config for undotree", false)
-- Config for: kommentary
time("Config for kommentary", true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/kommentary\frequire\0", "config", "kommentary")
time("Config for kommentary", false)
-- Config for: vim-vsnip
time("Config for vim-vsnip", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/snippets\frequire\0", "config", "vim-vsnip")
time("Config for vim-vsnip", false)
-- Config for: git-blame.nvim
time("Config for git-blame.nvim", true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14ext/blame\frequire\0", "config", "git-blame.nvim")
time("Config for git-blame.nvim", false)
-- Config for: lsp-trouble.nvim
time("Config for lsp-trouble.nvim", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16ext/trouble\frequire\0", "config", "lsp-trouble.nvim")
time("Config for lsp-trouble.nvim", false)
-- Config for: telescope-fzy-native.nvim
time("Config for telescope-fzy-native.nvim", true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15fzy_native\19load_extension\14telescope\frequire\0", "config", "telescope-fzy-native.nvim")
time("Config for telescope-fzy-native.nvim", false)
-- Config for: nvim-hlslens
time("Config for nvim-hlslens", true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16ext/hlslens\frequire\0", "config", "nvim-hlslens")
time("Config for nvim-hlslens", false)
-- Config for: surround.nvim
time("Config for surround.nvim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time("Config for surround.nvim", false)
-- Config for: foldsigns.nvim
time("Config for foldsigns.nvim", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14foldsigns\frequire\0", "config", "foldsigns.nvim")
time("Config for foldsigns.nvim", false)
-- Config for: shade.nvim
time("Config for shade.nvim", true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14ext/shade\frequire\0", "config", "shade.nvim")
time("Config for shade.nvim", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20ext/indentlines\frequire\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: faster.nvim
time("Config for faster.nvim", true)
try_loadstring("\27LJ\2\n½\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\1\vsilent\2\26<Plug>(faster_move_k)\6k\1\0\2\fnoremap\1\vsilent\2\26<Plug>(faster_move_j)\6j\6n\20nvim_set_keymap\bapi\bvim\0", "config", "faster.nvim")
time("Config for faster.nvim", false)
-- Config for: symbols-outline.nvim
time("Config for symbols-outline.nvim", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time("Config for symbols-outline.nvim", false)
-- Config for: telescope-lsp-handlers.nvim
time("Config for telescope-lsp-handlers.nvim", true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17lsp_handlers\19load_extension\14telescope\frequire\0", "config", "telescope-lsp-handlers.nvim")
time("Config for telescope-lsp-handlers.nvim", false)
-- Config for: nvim-biscuits
time("Config for nvim-biscuits", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/biscuits\frequire\0", "config", "nvim-biscuits")
time("Config for nvim-biscuits", false)
-- Config for: nvim-lint
time("Config for nvim-lint", true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/lint\frequire\0", "config", "nvim-lint")
time("Config for nvim-lint", false)
-- Config for: nvim-ts-autotag
time("Config for nvim-ts-autotag", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time("Config for nvim-ts-autotag", false)
-- Config for: TrueZen.nvim
time("Config for TrueZen.nvim", true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fext/zen\frequire\0", "config", "TrueZen.nvim")
time("Config for TrueZen.nvim", false)
-- Config for: presence.nvim
time("Config for presence.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/presence\frequire\0", "config", "presence.nvim")
time("Config for presence.nvim", false)
-- Config for: jumpwire.nvim
time("Config for jumpwire.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/jumpwire\frequire\0", "config", "jumpwire.nvim")
time("Config for jumpwire.nvim", false)
-- Config for: barbar.nvim
time("Config for barbar.nvim", true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15ext/barbar\frequire\0", "config", "barbar.nvim")
time("Config for barbar.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: neoscroll.nvim
time("Config for neoscroll.nvim", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time("Config for neoscroll.nvim", false)
-- Config for: git-worktree.nvim
time("Config for git-worktree.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/worktree\frequire\0", "config", "git-worktree.nvim")
time("Config for git-worktree.nvim", false)
-- Config for: telescope-arecibo.nvim
time("Config for telescope-arecibo.nvim", true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\farecibo\19load_extension\14telescope\frequire\0", "config", "telescope-arecibo.nvim")
time("Config for telescope-arecibo.nvim", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/whichkey\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: diffview.nvim
time("Config for diffview.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/diffview\frequire\0", "config", "diffview.nvim")
time("Config for diffview.nvim", false)
-- Config for: nvim-dap
time("Config for nvim-dap", true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fext/dap\frequire\0", "config", "nvim-dap")
time("Config for nvim-dap", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/completion\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vgit.nvim
time("Config for vgit.nvim", true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/vgit\frequire\0", "config", "vgit.nvim")
time("Config for vgit.nvim", false)
-- Config for: telescope-dap.nvim
time("Config for telescope-dap.nvim", true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time("Config for telescope-dap.nvim", false)
-- Config for: numb.nvim
time("Config for numb.nvim", true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time("Config for numb.nvim", false)
-- Config for: formatter.nvim
time("Config for formatter.nvim", true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15ext/format\frequire\0", "config", "formatter.nvim")
time("Config for formatter.nvim", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/todo\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: telescope-frecency.nvim
time("Config for telescope-frecency.nvim", true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time("Config for telescope-frecency.nvim", false)
-- Config for: nvim-lastplace
time("Config for nvim-lastplace", true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time("Config for nvim-lastplace", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/nvimtree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: ISuckAtSpelling.nvim
time("Config for ISuckAtSpelling.nvim", true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rext/isas\frequire\0", "config", "ISuckAtSpelling.nvim")
time("Config for ISuckAtSpelling.nvim", false)
-- Config for: dashboard-nvim
time("Config for dashboard-nvim", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/dashboard\frequire\0", "config", "dashboard-nvim")
time("Config for dashboard-nvim", false)
-- Config for: gitlinker.nvim
time("Config for gitlinker.nvim", true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ext/gitlinker\frequire\0", "config", "gitlinker.nvim")
time("Config for gitlinker.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17ext/gitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19ext/galaxyline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: spellsitter.nvim
time("Config for spellsitter.nvim", true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20ext/spellsitter\frequire\0", "config", "spellsitter.nvim")
time("Config for spellsitter.nvim", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType rs ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'manillua.nvim', 'nlua.nvim', 'BetterLua.vim', 'nvim-luadev'}, { ft = "lua" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
