--# selene: allow(global_usage)
_G.reload = function(...)
	return require('plenary.reload').reload_module(...)
end

_G.r = function(name)
	_G.reload(name)
	return require(name)
end

_G.dump = function(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
	return ...
end

local M = {}

function M.termcode(key)
	return vim.api.nvim_replace_termcodes(key, true, true, true)
end

function M.adjust_color(color, amount)
	color = vim.trim(color)
	color = color:gsub('#', '')
	local first = ('0' .. string.format('%x', (math.min(255, tonumber(color:sub(1, 2), 16) + amount)))):sub(-2)
	local second = ('0' .. string.format('%x', (math.min(255, tonumber(color:sub(3, 4), 16) + amount)))):sub(-2)
	local third = ('0' .. string.format('%x', (math.min(255, tonumber(color:sub(5, -1), 16) + amount)))):sub(-2)
	return '#' .. first .. second .. third
end

function M.lighten(color, amount)
	return M.adjust_color(color, amount)
end

function M.darken(color, amount)
	return M.adjust_color(color, -amount)
end

return M
