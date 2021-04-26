vim.g.indent_blankline_filetype_exclude = {'dashboard', 'startify', 'help'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}

vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.g.indent_blankline_char = "▎"
-- vim.g.indent_blankline_char = "▏"

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
	'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
	'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
	'catch_clause', 'import_statement'
}
vim.g.indent_blankline_context_highlight = 'Number'
-- vim.g.indent_blankline_context_highlight_list

vim.g.indentLine_enabled = 1

vim.g.indent_blankline_indent_level = 16

vim.g.indent_blankline_show_first_indent_level = true

vim.g.indent_blankline_show_end_of_line = true
