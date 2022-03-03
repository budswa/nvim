local lint = require('lint')
local selene = require('lint.linters.selene')
local luacheck = require('lint.linters.luacheck')

selene.args = {
    '--config',
    vim.fn.stdpath('config') .. '/selene.toml'
}

luacheck.args = {
    '--config',
    vim.fn.stdpath('config') .. '/.luacheckrc'
}

lint.linter_by_ft = {
	lua = { 'selene', 'luacheck' }
}

vim.cmd([[au TextChanged,TextChangedI <buffer> lua require('lint').try_lint()]])
