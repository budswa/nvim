require('bufferline').setup({
	options = {
		numbers = 'none',
		tab_size = 24,
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Explorer',
				text_align = 'center',
				highlight = 'NvimTreeNormal',
			},
			{
				filetype = 'packer',
				text = 'Packer',
				text_align = 'center'
			},
			{
				filetype = "Outline",
				text = 'Symbol outline',
				text_align = "center",
				highlight = "Green",
			},
		},
	}
})
