--# selene: allow(global_usage)
--_G.nvim = {}
--for k, v in pairs(vim.api) do
--	_G.nvim[k:gsub('^nvim_', '')] = v
--end

--_G.preload = function(module)
--	local ok, mod = pcall(require, module)
--	return ok, mod
--end

_G.reload = function(...)
	return require('plenary.reload').reload_module(...)
end

_G.R = function(name)
	_G.reload(name)
	return require(name)
end

_G.dump = function(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
	return ...
end
