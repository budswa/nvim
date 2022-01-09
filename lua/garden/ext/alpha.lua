local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
	'                                                                              ',
	'=================     ===============     ===============   ========  ========',
	'\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //',
	'||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||',
	'|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||',
	'||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||',
	'|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||',
	"||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
	'|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||',
	"||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
	"||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
	"||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
	"||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
	"||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
	"||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
	"||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
	"||.=='    _-'                                                     `' |  /==.||",
	"=='    _-'                        N E O V I M                         \\/   `==",
	"\\   _-'                                                                `-_   /",
	" `''                                                                      ``'  ",
}

dashboard.section.buttons.val = {
	dashboard.button('l', 'Load session', ':LoadCurrentDirSession<cr>'),
	dashboard.button('s', 'Find session', ':Telescope sessions<cr>'),
	dashboard.button('e', '  New file', ':ene<cr>'),
	dashboard.button('f', ' Find file', ':Telescope find_files<cr>'),
	dashboard.button('w', ' Find word', ':Telescope live_grep<cr>'),
	dashboard.button('q', ' Quit', ':q!<cr>')
}

dashboard.section.footer.val = {
	'Neovim loaded with ' .. #vim.tbl_keys(packer_plugins) .. ' plugins in ' .. vim.fn.printf(
		'%.3f',
		vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
	) .. ' seconds.',
}

alpha.setup(dashboard.opts)
