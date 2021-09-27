require('bufferline').setup({
	options = {
		numbers = 'none',
		tab_size = 24,
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Explorer',
				text_align = 'left',
				highlight = 'NvimTreeNormal',
			},
			{
				filetype = 'alpha',
				text = 'Alpha',
				text_align = 'center'
			},
			{
				filetype = "Outline",
				text = 'Symbol outline',
				highlight = "Green",
				text_align = "center",
			},
		},
	}
})
