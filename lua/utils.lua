local utils = {}

-- Check if a file or directory exists in this path
function utils.dir_exists(path)
  return io.open(path, "r") and true or false
end

-- Create directory if it doesn't exist yet
function utils.mkdir(path)
  if utils.exists(path) then return false end
  return os.execute('mkdir ' .. path) and true or false
end

-- Check whether the current buffer is empty
function utils.is_buffer_empty()
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

-- Check if the windows width is greater than a given number of columns
function utils.has_width_gt(cols)
    return vim.fn.winwidth(0) / 2 > cols
end

function utils.create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

-- Removes trailing whitespace within window
function utils.remove_trailing_whitespace()
	local view = vim.fn.winsaveview()
	vim.cmd([[keeppatterns %s/\s\+$//e]])
	vim.fn.winrestview(view)
end

local special_buffers = {
  'qf',
  'git',
  'help',
  'term',
  'vista',
  'help',
  'packer',
  'undotree',
  'startify',
  'NvimTree',
  'startuptime',
}

function utils.list_special_buffers()
  return special_buffers
end

function utils.is_special_buffer()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'terminal' or buftype == 'quickfix' or buftype == 'help' then
    return true
  end
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  for _, b in ipairs(special_buffers) do
    if filetype == b then
      return true
    end
  end
  return false
end

return utils
