vim.opt.termguicolors = true

local ok, impatient = pcall(require, 'impatient')
if ok then
    require('packer_compiled')
    impatient.enable_profile()
end

require('garden/plugins')
require('garden/options')
require('garden/autocmds')
require('garden/mappings')
