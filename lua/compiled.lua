-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
	vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
	return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()
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
			sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
		end
		table.sort(sorted_times, function(a, b)
			return a[2] > b[2]
		end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
			end
		end

		_G._packer = _G._packer or {}
		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str =
		'/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua'
	local install_cpath_pattern = '/home/m2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so'
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
				vim.api.nvim_notify(
					'packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
					vim.log.levels.ERROR,
					{}
				)
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		['Comment.nvim'] = {
			config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.comment\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/Comment.nvim',
			url = 'https://github.com/numToStr/Comment.nvim',
		},
		['DAPInstall.nvim'] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim',
			url = 'https://github.com/Pocco81/DAPInstall.nvim',
		},
		['FixCursorHold.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim',
			url = 'https://github.com/antoinemadec/FixCursorHold.nvim',
		},
		LuaSnip = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/LuaSnip',
			url = 'https://github.com/L3MON4D3/LuaSnip',
		},
		NrrwRgn = {
			commands = { 'NR', 'NW' },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/NrrwRgn',
			url = 'https://github.com/chrisbra/NrrwRgn',
		},
		['TrueZen.nvim'] = {
			commands = { 'ZenMode' },
			config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.zen\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim',
			url = 'https://github.com/Pocco81/TrueZen.nvim',
		},
		['alpha-nvim'] = {
			config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.alpha\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/alpha-nvim',
			url = 'https://github.com/goolord/alpha-nvim',
		},
		['better-escape.nvim'] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/better-escape.nvim',
			url = 'https://github.com/max397574/better-escape.nvim',
		},
		['cmp-buffer'] = {
			after_files = { '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua' },
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-buffer',
			url = 'https://github.com/hrsh7th/cmp-buffer',
		},
		['cmp-calc'] = {
			after_files = { '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua' },
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-calc',
			url = 'https://github.com/hrsh7th/cmp-calc',
		},
		['cmp-cmdline'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-cmdline',
			url = 'https://github.com/hrsh7th/cmp-cmdline',
		},
		['cmp-copilot'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-copilot/after/plugin/cmp_copilot.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-copilot',
			url = 'https://github.com/hrsh7th/cmp-copilot',
		},
		['cmp-git'] = {
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-git',
			url = 'https://github.com/petertriho/cmp-git',
		},
		['cmp-nvim-lsp'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp',
			url = 'https://github.com/hrsh7th/cmp-nvim-lsp',
		},
		['cmp-nvim-lsp-signature-help'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help',
			url = 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help',
		},
		['cmp-nvim-lua'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua',
			url = 'https://github.com/hrsh7th/cmp-nvim-lua',
		},
		['cmp-path'] = {
			after_files = { '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua' },
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-path',
			url = 'https://github.com/hrsh7th/cmp-path',
		},
		['cmp-rg'] = {
			after_files = { '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-rg/after/plugin/cmp-rg.lua' },
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-rg',
			url = 'https://github.com/lukas-reineke/cmp-rg',
		},
		['cmp-treesitter'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp-treesitter',
			url = 'https://github.com/ray-x/cmp-treesitter',
		},
		cmp_luasnip = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua',
			},
			load_after = {},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/cmp_luasnip',
			url = 'https://github.com/saadparwaiz1/cmp_luasnip',
		},
		['comment-box.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/comment-box.nvim',
			url = 'https://github.com/LudoPinelli/comment-box.nvim',
		},
		['copilot.vim'] = {
			commands = { 'Copilot' },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/copilot.vim',
			url = 'https://github.com/github/copilot.vim',
		},
		['diffview.nvim'] = {
			commands = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewRefresh' },
			config = {
				"\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdiffview\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/diffview.nvim',
			url = 'https://github.com/sindrets/diffview.nvim',
		},
		['dressing.nvim'] = {
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.dressing\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/dressing.nvim',
			url = 'https://github.com/stevearc/dressing.nvim',
		},
		['editorconfig.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/editorconfig.nvim',
			url = 'https://github.com/gpanders/editorconfig.nvim',
		},
		['fidget.nvim'] = {
			config = {
				"\27LJ\2\n`\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ttext\1\0\0\1\0\1\fspinner\17bouncing_bar\nsetup\vfidget\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/fidget.nvim',
			url = 'https://github.com/j-hui/fidget.nvim',
		},
		['filetype.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/filetype.nvim',
			url = 'https://github.com/nathom/filetype.nvim',
		},
		['friendly-snippets'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/friendly-snippets',
			url = 'https://github.com/rafamadriz/friendly-snippets',
		},
		['github-nvim-theme'] = {
			config = {
				"\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17github-theme\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/github-nvim-theme',
			url = 'https://github.com/projekt0n/github-nvim-theme',
		},
		['gitlinker.nvim'] = {
			config = {
				"\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14gitlinker\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/gitlinker.nvim',
			url = 'https://github.com/ruifm/gitlinker.nvim',
		},
		['gitsigns.nvim'] = {
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim',
			url = 'https://github.com/lewis6991/gitsigns.nvim',
		},
		harpoon = {
			config = {
				"\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fharpoon\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/harpoon',
			url = 'https://github.com/ThePrimeagen/harpoon',
		},
		['impatient.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/impatient.nvim',
			url = 'https://github.com/lewis6991/impatient.nvim',
		},
		['indent-blankline.nvim'] = {
			config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.indentline\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim',
			url = 'https://github.com/lukas-reineke/indent-blankline.nvim',
		},
		['iswap.nvim'] = {
			commands = { 'ISwap', 'ISwapWith' },
			config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.iswap\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/iswap.nvim',
			url = 'https://github.com/mizlan/iswap.nvim',
		},
		['lightspeed.nvim'] = {
			config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.lightspeed\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim',
			url = 'https://github.com/ggandor/lightspeed.nvim',
		},
		['lsp-command'] = {
			after_files = {
				'/home/m2/.local/share/nvim/site/pack/packer/opt/lsp-command/after/plugin/lsp-command.vim',
			},
			load_after = {
				['nvim-lspconfig'] = true,
			},
			loaded = false,
			needs_bufread = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/lsp-command',
			url = 'https://github.com/ii14/lsp-command',
		},
		['lsp_signature.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim',
			url = 'https://github.com/ray-x/lsp_signature.nvim',
		},
		['lspkind-nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/lspkind-nvim',
			url = 'https://github.com/onsails/lspkind-nvim',
		},
		['lua-dev.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/lua-dev.nvim',
			url = 'https://github.com/folke/lua-dev.nvim',
		},
		['lualine.nvim'] = {
			config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/lualine.nvim',
			url = 'https://github.com/nvim-lualine/lualine.nvim',
		},
		['luv-vimdocs'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/luv-vimdocs',
			url = 'https://github.com/nanotee/luv-vimdocs',
		},
		['matchparen.nvim'] = {
			config = {
				"\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15matchparen\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/matchparen.nvim',
			url = 'https://github.com/monkoose/matchparen.nvim',
		},
		['move.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/move.nvim',
			url = 'https://github.com/fedepujol/move.nvim',
		},
		neogen = {
			config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.neogen\frequire\0" },
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/neogen',
			url = 'https://github.com/danymat/neogen',
		},
		neorg = {
			config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.neorg\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/neorg',
			url = 'https://github.com/nvim-neorg/neorg',
		},
		['neovim-session-manager'] = {
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.sessions\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/neovim-session-manager',
			url = 'https://github.com/Shatur/neovim-session-manager',
		},
		['nlua.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nlua.nvim',
			url = 'https://github.com/tjdevries/nlua.nvim',
		},
		['null-ls.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/null-ls.nvim',
			url = 'https://github.com/jose-elias-alvarez/null-ls.nvim',
		},
		['numb.nvim'] = {
			config = {
				"\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/numb.nvim',
			url = 'https://github.com/nacro90/numb.nvim',
		},
		['nvim-autopairs'] = {
			config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-autopairs',
			url = 'https://github.com/windwp/nvim-autopairs',
		},
		['nvim-bqf'] = {
			config = {
				"\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bbqf\frequire\0",
			},
			loaded = false,
			needs_bufread = true,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-bqf',
			url = 'https://github.com/kevinhwang91/nvim-bqf',
		},
		['nvim-cmp'] = {
			after = {
				'cmp-path',
				'cmp-calc',
				'cmp-git',
				'cmp-nvim-lua',
				'cmp-nvim-lsp-signature-help',
				'cmp-treesitter',
				'cmp-cmdline',
				'cmp-copilot',
				'cmp-buffer',
				'cmp-nvim-lsp',
				'cmp-rg',
				'cmp_luasnip',
			},
			loaded = true,
			only_config = true,
		},
		['nvim-code-action-menu'] = {
			commands = { 'CodeActionMenu' },
			loaded = false,
			needs_bufread = true,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu',
			url = 'https://github.com/weilbith/nvim-code-action-menu',
		},
		['nvim-colorizer.lua'] = {
			config = {
				"\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua',
			url = 'https://github.com/norcalli/nvim-colorizer.lua',
		},
		['nvim-dap'] = {
			config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.dap\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-dap',
			url = 'https://github.com/mfussenegger/nvim-dap',
		},
		['nvim-dap-ui'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-dap-ui',
			url = 'https://github.com/rcarriga/nvim-dap-ui',
		},
		['nvim-hlslens'] = {
			config = {
				"\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fhlslens\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-hlslens',
			url = 'https://github.com/kevinhwang91/nvim-hlslens',
		},
		['nvim-lastplace'] = {
			config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.lastplace\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-lastplace',
			url = 'https://github.com/ethanholz/nvim-lastplace',
		},
		['nvim-lsp-installer'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer',
			url = 'https://github.com/williamboman/nvim-lsp-installer',
		},
		['nvim-lspconfig'] = {
			after = { 'lsp-command' },
			config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig',
			url = 'https://github.com/neovim/nvim-lspconfig',
		},
		['nvim-markdown-preview'] = {
			config = {
				"\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\vgithub nvim_markdown_preview_theme\6g\bvim\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-markdown-preview',
			url = 'https://github.com/davidgranstrom/nvim-markdown-preview',
		},
		['nvim-neoclip.lua'] = {
			config = {
				"\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua',
			url = 'https://github.com/AckslD/nvim-neoclip.lua',
		},
		['nvim-paste-fix'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-paste-fix',
			url = 'https://github.com/zeertzjq/nvim-paste-fix',
		},
		['nvim-spectre'] = {
			config = {
				"\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-spectre',
			url = 'https://github.com/nvim-pack/nvim-spectre',
		},
		['nvim-tree.lua'] = {
			commands = { 'NvimTreeToggle', 'NvimTreeRefresh' },
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.nvimtree\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua',
			url = 'https://github.com/kyazdani42/nvim-tree.lua',
		},
		['nvim-treesitter'] = {
			after = { 'neogen' },
			loaded = true,
			only_config = true,
		},
		['nvim-treesitter-endwise'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise',
			url = 'https://github.com/RRethy/nvim-treesitter-endwise',
		},
		['nvim-treesitter-refactor'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor',
			url = 'https://github.com/nvim-treesitter/nvim-treesitter-refactor',
		},
		['nvim-treesitter-textobjects'] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects',
			url = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
		},
		['nvim-treesitter-textsubjects'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects',
			url = 'https://github.com/RRethy/nvim-treesitter-textsubjects',
		},
		['nvim-ts-autotag'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag',
			url = 'https://github.com/windwp/nvim-ts-autotag',
		},
		['nvim-ts-context-commentstring'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring',
			url = 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
		},
		['nvim-ts-rainbow'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow',
			url = 'https://github.com/p00f/nvim-ts-rainbow',
		},
		['nvim-web-devicons'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-web-devicons',
			url = 'https://github.com/kyazdani42/nvim-web-devicons',
		},
		['nvim-yati'] = {
			config = {
				"\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tyati\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim-yati',
			url = 'https://github.com/yioneko/nvim-yati',
		},
		nvim_context_vt = {
			config = {
				"\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vprefix\b-->\nsetup\20nvim_context_vt\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/nvim_context_vt',
			url = 'https://github.com/haringsrob/nvim_context_vt',
		},
		['one-small-step-for-vimkind'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind',
			url = 'https://github.com/jbyuki/one-small-step-for-vimkind',
		},
		['packer.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/packer.nvim',
			url = 'https://github.com/wbthomason/packer.nvim',
		},
		['paperplanes.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/paperplanes.nvim',
			url = 'https://github.com/rktjmp/paperplanes.nvim',
		},
		playground = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/playground',
			url = 'https://github.com/nvim-treesitter/playground',
		},
		['plenary.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/plenary.nvim',
			url = 'https://github.com/nvim-lua/plenary.nvim',
		},
		['popup.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/popup.nvim',
			url = 'https://github.com/nvim-lua/popup.nvim',
		},
		['pretty-fold.nvim'] = {
			config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.fold\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim',
			url = 'https://github.com/anuvyklack/pretty-fold.nvim',
		},
		['quickfix-reflector.vim'] = {
			config = {
				'\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21qf_write_changes\6g\bvim\0',
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/quickfix-reflector.vim',
			url = 'https://github.com/stefandtw/quickfix-reflector.vim',
		},
		['refactoring.nvim'] = {
			config = {
				"\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16refactoring\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/refactoring.nvim',
			url = 'https://github.com/ThePrimeagen/refactoring.nvim',
		},
		['spellsitter.nvim'] = {
			config = {
				"\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0",
			},
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/spellsitter.nvim',
			url = 'https://github.com/lewis6991/spellsitter.nvim',
		},
		['sqlite.lua'] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/sqlite.lua',
			url = 'https://github.com/tami5/sqlite.lua',
		},
		['surround.nvim'] = {
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.surround\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/surround.nvim',
			url = 'https://github.com/blackCauldron7/surround.nvim',
		},
		['tabout.nvim'] = {
			config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tabout\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/tabout.nvim',
			url = 'https://github.com/abecodes/tabout.nvim',
		},
		['telescope-file-browser.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim',
			url = 'https://github.com/nvim-telescope/telescope-file-browser.nvim',
		},
		['telescope-frecency.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim',
			url = 'https://github.com/nvim-telescope/telescope-frecency.nvim',
		},
		['telescope-hop.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/telescope-hop.nvim',
			url = 'https://github.com/nvim-telescope/telescope-hop.nvim',
		},
		['telescope-symbols.nvim'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim',
			url = 'https://github.com/nvim-telescope/telescope-symbols.nvim',
		},
		['telescope.nvim'] = {
			config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/telescope.nvim',
			url = 'https://github.com/nvim-telescope/telescope.nvim',
		},
		['todo-comments.nvim'] = {
			config = {
				"\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0",
			},
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim',
			url = 'https://github.com/folke/todo-comments.nvim',
		},
		['toggleterm.nvim'] = {
			config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.toggleterm\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim',
			url = 'https://github.com/akinsho/toggleterm.nvim',
		},
		['tree-setter'] = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/tree-setter',
			url = 'https://github.com/TornaxO7/tree-setter',
		},
		['trouble.nvim'] = {
			commands = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
			config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.trouble\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/trouble.nvim',
			url = 'https://github.com/folke/trouble.nvim',
		},
		['twilight.nvim'] = {
			commands = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.twilight\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/twilight.nvim',
			url = 'https://github.com/folke/twilight.nvim',
		},
		undotree = {
			commands = { 'UndotreeToggle' },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/undotree',
			url = 'https://github.com/mbbill/undotree',
		},
		['vim-startuptime'] = {
			commands = { 'StartupTime' },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/vim-startuptime',
			url = 'https://github.com/dstein64/vim-startuptime',
		},
		['vim-table-mode'] = {
			commands = { 'TableModeToggle' },
			loaded = false,
			needs_bufread = true,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/vim-table-mode',
			url = 'https://github.com/dhruvasagar/vim-table-mode',
		},
		['vim-textobj-user'] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/vim-textobj-user',
			url = 'https://github.com/kana/vim-textobj-user',
		},
		vim9jit = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/vim9jit',
			url = 'https://github.com/tjdevries/vim9jit',
		},
		vusted = {
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/vusted',
			url = 'https://github.com/notomo/vusted',
		},
		['which-key.nvim'] = {
			config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.whichkey\frequire\0" },
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = '/home/m2/.local/share/nvim/site/pack/packer/opt/which-key.nvim',
			url = 'https://github.com/max397574/which-key.nvim',
		},
		['zk-nvim'] = {
			config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugins.zk\frequire\0" },
			loaded = true,
			path = '/home/m2/.local/share/nvim/site/pack/packer/start/zk-nvim',
			url = 'https://github.com/mickael-menu/zk-nvim',
		},
	}

	time([[Defining packer_plugins]], false)
	local module_lazy_loads = {
		['^sqlite'] = 'sqlite.lua',
	}
	local lazy_load_called = { ['packer.load'] = true }
	local function lazy_load_module(module_name)
		local to_load = {}
		if lazy_load_called[module_name] then
			return nil
		end
		lazy_load_called[module_name] = true
		for module_pat, plugin_name in pairs(module_lazy_loads) do
			if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
				to_load[#to_load + 1] = plugin_name
			end
		end

		if #to_load > 0 then
			require('packer.load')(to_load, { module = module_name }, _G.packer_plugins)
			local loaded_mod = package.loaded[module_name]
			if loaded_mod then
				return function(modname)
					return loaded_mod
				end
			end
		end
	end

	if not vim.g.packer_custom_loader_enabled then
		table.insert(package.loaders, 1, lazy_load_module)
		vim.g.packer_custom_loader_enabled = true
	end

	-- Config for: indent-blankline.nvim
	time([[Config for indent-blankline.nvim]], true)
	try_loadstring(
		"\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.indentline\frequire\0",
		'config',
		'indent-blankline.nvim'
	)
	time([[Config for indent-blankline.nvim]], false)
	-- Config for: nvim_context_vt
	time([[Config for nvim_context_vt]], true)
	try_loadstring(
		"\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vprefix\b-->\nsetup\20nvim_context_vt\frequire\0",
		'config',
		'nvim_context_vt'
	)
	time([[Config for nvim_context_vt]], false)
	-- Config for: harpoon
	time([[Config for harpoon]], true)
	try_loadstring(
		"\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fharpoon\frequire\0",
		'config',
		'harpoon'
	)
	time([[Config for harpoon]], false)
	-- Config for: nvim-yati
	time([[Config for nvim-yati]], true)
	try_loadstring(
		"\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tyati\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0",
		'config',
		'nvim-yati'
	)
	time([[Config for nvim-yati]], false)
	-- Config for: neovim-session-manager
	time([[Config for neovim-session-manager]], true)
	try_loadstring(
		"\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.sessions\frequire\0",
		'config',
		'neovim-session-manager'
	)
	time([[Config for neovim-session-manager]], false)
	-- Config for: nvim-neoclip.lua
	time([[Config for nvim-neoclip.lua]], true)
	try_loadstring(
		"\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0",
		'config',
		'nvim-neoclip.lua'
	)
	time([[Config for nvim-neoclip.lua]], false)
	-- Config for: spellsitter.nvim
	time([[Config for spellsitter.nvim]], true)
	try_loadstring(
		"\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0",
		'config',
		'spellsitter.nvim'
	)
	time([[Config for spellsitter.nvim]], false)
	-- Config for: nvim-markdown-preview
	time([[Config for nvim-markdown-preview]], true)
	try_loadstring(
		"\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\vgithub nvim_markdown_preview_theme\6g\bvim\0",
		'config',
		'nvim-markdown-preview'
	)
	time([[Config for nvim-markdown-preview]], false)
	-- Config for: pretty-fold.nvim
	time([[Config for pretty-fold.nvim]], true)
	try_loadstring(
		"\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.fold\frequire\0",
		'config',
		'pretty-fold.nvim'
	)
	time([[Config for pretty-fold.nvim]], false)
	-- Config for: matchparen.nvim
	time([[Config for matchparen.nvim]], true)
	try_loadstring(
		"\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15matchparen\frequire\0",
		'config',
		'matchparen.nvim'
	)
	time([[Config for matchparen.nvim]], false)
	-- Config for: alpha-nvim
	time([[Config for alpha-nvim]], true)
	try_loadstring(
		"\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.alpha\frequire\0",
		'config',
		'alpha-nvim'
	)
	time([[Config for alpha-nvim]], false)
	-- Config for: neorg
	time([[Config for neorg]], true)
	try_loadstring(
		"\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.neorg\frequire\0",
		'config',
		'neorg'
	)
	time([[Config for neorg]], false)
	-- Config for: quickfix-reflector.vim
	time([[Config for quickfix-reflector.vim]], true)
	try_loadstring(
		'\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21qf_write_changes\6g\bvim\0',
		'config',
		'quickfix-reflector.vim'
	)
	time([[Config for quickfix-reflector.vim]], false)
	-- Config for: zk-nvim
	time([[Config for zk-nvim]], true)
	try_loadstring(
		"\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15plugins.zk\frequire\0",
		'config',
		'zk-nvim'
	)
	time([[Config for zk-nvim]], false)
	-- Config for: fidget.nvim
	time([[Config for fidget.nvim]], true)
	try_loadstring(
		"\27LJ\2\n`\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ttext\1\0\0\1\0\1\fspinner\17bouncing_bar\nsetup\vfidget\frequire\0",
		'config',
		'fidget.nvim'
	)
	time([[Config for fidget.nvim]], false)
	-- Config for: lualine.nvim
	time([[Config for lualine.nvim]], true)
	try_loadstring(
		"\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0",
		'config',
		'lualine.nvim'
	)
	time([[Config for lualine.nvim]], false)
	-- Config for: telescope.nvim
	time([[Config for telescope.nvim]], true)
	try_loadstring(
		"\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0",
		'config',
		'telescope.nvim'
	)
	time([[Config for telescope.nvim]], false)
	-- Config for: nvim-treesitter
	time([[Config for nvim-treesitter]], true)
	try_loadstring(
		"\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0",
		'config',
		'nvim-treesitter'
	)
	time([[Config for nvim-treesitter]], false)
	-- Config for: nvim-cmp
	time([[Config for nvim-cmp]], true)
	try_loadstring(
		"\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.cmp\frequire\0",
		'config',
		'nvim-cmp'
	)
	time([[Config for nvim-cmp]], false)
	-- Load plugins in order defined by `after`
	time([[Sequenced loading]], true)
	vim.cmd([[ packadd neogen ]])

	-- Config for: neogen
	try_loadstring(
		"\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.neogen\frequire\0",
		'config',
		'neogen'
	)

	time([[Sequenced loading]], false)

	-- Command lazy-loads
	time([[Defining lazy-load commands]], true)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file TroubleClose lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'TrueZen.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file ISwap lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file ISwapWith lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwapWith", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file Copilot lua require("packer.load")({'copilot.vim'}, { cmd = "Copilot", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file DiffviewClose lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file DiffviewRefresh lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file NW lua require("packer.load")({'NrrwRgn'}, { cmd = "NW", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file NR lua require("packer.load")({'NrrwRgn'}, { cmd = "NR", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file TwilightDisable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	pcall(
		vim.cmd,
		[[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
	)
	time([[Defining lazy-load commands]], false)

	vim.cmd([[augroup packer_load_aucmds]])
	vim.cmd([[au!]])
	-- Filetype lazy-loads
	time([[Defining lazy-load filetype autocommands]], true)
	vim.cmd([[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]])
	time([[Defining lazy-load filetype autocommands]], false)
	-- Event lazy-loads
	time([[Defining lazy-load event autocommands]], true)
	vim.cmd([[au VimEnter * ++once lua require("packer.load")({'github-nvim-theme'}, { event = "VimEnter *" }, _G.packer_plugins)]])
	vim.cmd([[au CmdLineEnter * ++once lua require("packer.load")({'cmp-nvim-lsp-signature-help', 'cmp-cmdline'}, { event = "CmdLineEnter *" }, _G.packer_plugins)]])
	vim.cmd([[au BufEnter * ++once lua require("packer.load")({'nvim-spectre', 'vim-textobj-user'}, { event = "BufEnter *" }, _G.packer_plugins)]])
	vim.cmd([[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig', 'nvim-dap', 'DAPInstall.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]])
	vim.cmd([[au BufRead * ++once lua require("packer.load")({'nvim-treesitter-textobjects', 'gitsigns.nvim', 'lightspeed.nvim', 'gitlinker.nvim', 'nvim-hlslens', 'nvim-colorizer.lua', 'todo-comments.nvim', 'tabout.nvim', 'numb.nvim', 'surround.nvim', 'Comment.nvim', 'nvim-lastplace', 'refactoring.nvim', 'nvim-autopairs'}, { event = "BufRead *" }, _G.packer_plugins)]])
	vim.cmd([[au BufNewFile * ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "BufNewFile *" }, _G.packer_plugins)]])
	vim.cmd([[au InsertEnter * ++once lua require("packer.load")({'cmp-path', 'cmp-calc', 'cmp-git', 'cmp-nvim-lua', 'better-escape.nvim', 'cmp-treesitter', 'cmp-copilot', 'cmp-buffer', 'cmp-nvim-lsp', 'cmp-rg', 'cmp_luasnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]])
	vim.cmd([[au BufWinEnter * ++once lua require("packer.load")({'dressing.nvim', 'which-key.nvim', 'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]])
	time([[Defining lazy-load event autocommands]], false)
	vim.cmd('augroup END')
	if should_profile then
		save_profiles()
	end
end)

if not no_errors then
	vim.api.nvim_command(
		'echohl ErrorMsg | echom "Error in packer_compiled: '
			.. error_msg
			.. '" | echom "Please check your config for correctness" | echohl None'
	)
end
