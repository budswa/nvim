local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
	'⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
	'⠀⠀⠀⠀⠀⢫⠉⠒⠲⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠈⠙⠒⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠈⣆⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⣀⣀⠤⠤⠖⠒⠒⠒⠒⠊⠵⢤⡀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⠴⡖⠋⠉⣀⣀⣀⠀⠀⠀⠀⠀⠀⡠⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢈⣭⣀⣀⣀⠀⠀⠀⠀⢀⠤⠃⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠊⠘⢽⠬⠥⠯⠃⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠒⢤⠀⠀⠀⢸⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⣀⠎⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠈⢂⢹⢸⠀⠀⠀⡏⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⢇⣀⣀⡠⡘⠀⠀⠀⠀⠀⠀⠀⠀⠑⡄⠈⠩⠼⠀⠀⠜⡆⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⡄⠀⠀⠀⡇⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠒⠒⠚⠂⠀⠀⠀⠀⠀⠠⠒⠁⠀⠀⡇⠀⠀⠀⢇⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡯⠉⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⢀⡠⠃⠀⠀⠀⢸⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⢀⠞⠁⠀⠀⠀⠀⠀⠀⢀⣀⠤⠔⠒⠉⠁⢀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠈⠲⢤⣀⣀⣀⡠⠖⠉⠁⠸⡀⠀⠀⠀⠀⡜⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢀⠤⠊⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
}

--dashboard.section.header.val = {
--	'⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠻⠿⣿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿',
--	'⣿⣿⣿⣿⣿⣿⠟⠉⠄⠄⠄⠄⠄⠄⠄⠉⢟⠉⠄⠄⠄⠄⠄⠈⢻⣿⣿⣿⣿⣿',
--	'⣿⣿⣿⣿⡿⠃⠄⠄⠤⠐⠉⠉⠉⠉⠉⠒⠬⡣⠤⠤⠄⠄⠄⠤⠤⠿⣿⣿⣿⣿',
--	'⣿⣿⣿⣿⠁⠄⠄⠄⠄⠄⠄⠠⢀⡒⠤⠭⠅⠚⣓⡆⡆⣔⡙⠓⠚⠛⠄⣹⠿⣿',
--	'⣿⠟⠁⡌⠄⠄⠄⢀⠤⠬⠐⣈⠠⡤⠤⠤⣤⠤⢄⡉⢁⣀⣠⣤⣤⣀⣐⡖⢦⣽',
--	'⠏⠄⠄⠄⠄⠄⠄⠄⠐⠄⡿⠛⠯⠍⠭⣉⣉⠉⠍⢀⢀⡀⠉⠉⠉⠒⠒⠂⠄⣻',
--	'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠩⠵⠒⠒⠲⢒⡢⡉⠁⢐⡀⠬⠍⠁⢉⣉⣴⣿⣿',
--	'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⢉⣒⡉⠁⠁⠄⠄⠉⠂⠙⣉⣁⣀⣙⡿⣿⣿',
--	'⠄⠄⠄⠄⠄⠄⠄⠄⢠⠄⡖⢉⠥⢤⠐⢲⠒⢲⠒⢲⠒⠲⡒⠒⡖⢲⠂⠄⢀⣿',
--	'⠄⠄⠄⠄⠄⠄⠄⠄⠈⢆⡑⢄⠳⢾⠒⢺⠒⢺⠒⠚⡖⠄⡏⠉⣞⠞⠁⣠⣾⣿',
--	'⠄⠄⠄⠄⠄⠄⢆⠄⠄⠄⠈⠢⠉⠢⠍⣘⣒⣚⣒⣚⣒⣒⣉⠡⠤⣔⣾⣿⣿⣿',
--	'⠷⣤⠄⣀⠄⠄⠄⠈⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣤⣾⣿⣿⣿⣿⣿',
--	'⠄⠄⠉⠐⠢⠭⠄⢀⣒⣒⡒⠄⠄⠄⠄⠄⠄⣀⡠⠶⢶⣿⣿⣿⣿⣿⣿⣿⣿⣿',
--	'⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠁⠈⠄⠄⠄⠄⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⣿',
--}

dashboard.section.buttons.val = {
	dashboard.button('e', '  New file', '<cmd>ene<cr>'),
	dashboard.button('r', '  Recent files', '<cmd>Telescope frecency<cr>'),
	dashboard.button('f', '  Find file', '<cmd>Telescope find_files<cr>'),
	dashboard.button('b', '  Explore', '<cmd>Telescope file_browser<cr>'),
	dashboard.button('g', '  Ripgrep', '<cmd>Telescope live_grep<cr>'),
	dashboard.button('s', '  Find session', '<cmd>SessionManager load_session<cr>'),
	dashboard.button('l', '  Load session', '<cmd>SessionManager load_current_dir_session<cr>'),
	dashboard.button('t', '◫  Terminal', '<cmd>ToggleTerm<cr>'),
	dashboard.button('q', '  Quit Neovim', '<cmd>q!<cr>'),
}

dashboard.section.footer.val = {
	'Neovim loaded with ' .. #vim.tbl_keys(packer_plugins) .. ' plugins in ' .. vim.fn.printf(
		'%.3f',
		vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
	) .. ' seconds.',
}

alpha.setup(dashboard.opts)
