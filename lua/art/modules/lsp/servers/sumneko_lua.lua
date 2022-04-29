local rtp = vim.split(package.path, ';')
table.insert(rtp, 'lua/?.lua')
table.insert(rtp, 'lua/?/init.lua')

local options = {
	require('lua-dev').setup({
		library = { plugins = true, types = true, vimruntime = true },
		lspconfig = {
			settings = {
				runtime = { version = 'LuaJIT', path = rtp, vim.fn.expand('~') .. '/.config/nvim/lua/?.lua' },
				diagnostics = { globals = { 'vim', 'dump', 'RELOAD', 'R' } },
				workspace = { maxPreload = 100000 },
			},
		},
	}),
}

return options
