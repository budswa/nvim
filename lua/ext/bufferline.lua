require("bufferline").setup{
	options = {
    tab_size = 18,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated

    always_show_bufferline = false,

		numbers = "buffer_id",
		number_style = "none",

    show_tab_indicators = true,

		separator_style = "slant",

		show_close_icon = false,
		show_buffer_icons = true,
		show_buffer_close_icons = true,

		offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
	}
}
