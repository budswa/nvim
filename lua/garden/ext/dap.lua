require('dapui').setup()

-- local installation_path = vim.fn.stdpath("data") .. "/dapinstall/",

local dap = require('dap')

dap.set_log_level = 'TRACE'

dap.adapters.nlua = function(callback, config)
	callback({ type = 'server', host = config.host, port = config.port })
end

dap.configurations.lua = {
	{
		type = 'nlua',
		request = 'attach',
		name = 'Attach to running Neovim instance',
		host = function()
			local value = vim.fn.input('Host [127.0.0.1]: ')
			if value ~= '' then
				return value
			end
			return '127.0.0.1'
		end,
		port = function()
			local value = tonumber(vim.fn.input('Port [54321]: '))
			if value ~= '' then
				return value
			end
			return '54321'
		end,
	},
}
