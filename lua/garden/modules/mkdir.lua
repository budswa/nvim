local M = {}

local fn = vim.fn

function M.mkdir()
  local dir = fn.expand('%:p:h')

  if fn.isdirectory(dir) == 0 then
    fn.mkdir(dir, 'p')
  end
end

return M