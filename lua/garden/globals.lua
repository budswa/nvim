_G.reload = function(...)
	return require('plenary.reload').reload_module(...)
end

_G.inspect = function(...)
	--print(vim.inspect(...))
	local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
    return ...
end
