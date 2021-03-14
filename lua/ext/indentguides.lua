require("indent_guides").setup({
	indent_levels = 30,
	indent_guide_size = 2,
	indent_start_level = 1,
	indent_space_guides = true,
	indent_tab_guides = true,
	-- indent_soft_pattern = '\\s';
	exclude_filetypes = { "help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover" },
	even_colors = { fg = "#282c34", bg = "#282c34" },
	odd_colors = { fg = "#23272e", bg = "#23272e" },
})
