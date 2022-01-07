--# selene: allow(global_usage)
_G.reload = function(...)
	return require('plenary.reload').reload_module(...)
end

_G.inspect = function(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
	return ...
end

_G.nvim = {}
for k, v in pairs(vim.api) do
  _G.nvim[k:gsub('^nvim_', '')] = v
end
