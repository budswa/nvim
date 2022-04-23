local M = {}

--local heirline = require('heirline')
local conditions = require('heirline.conditions')
--local utils = require('heirline.utils')
--local colors = require('colors').get()

local function winwidth()
	return vim.api.nvim_call_function('winwidth', { 0 })
end

local function wordcount()
	local wc = vim.api.nvim_eval('wordcount()')
	if wc['visual_words'] then
		return wc['visual_words']
	else
		return wc['words']
	end
end
--
--M.word_count = {
--	{
--		provider = function()
--			return string.rep(' ', 5 - #tostring(word_counter())) .. ''
--		end,
--		hl = function()
--			return { fg = colors.lightbg }
--		end,
--	},
--	{
--		init = function(self)
--			self.mode = vim.fn.mode(1)
--		end,
--		provider = function()
--			return word_counter() .. ' '
--		end,
--		hl = function(self)
--			local mode = self.mode:sub(1, 1)
--			return { fg = mode_colors[mode], bg = colors.lightbg }
--		end,
--		condition = conditions.is_active(),
--	},
--}

return M
