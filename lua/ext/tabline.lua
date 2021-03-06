require'bufferline'.setup{
  options = {
    view = "multiwindow",
    numbers = "ordinal",
    number_style = "",
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '⮜',
    right_trunc_marker = '⮞',
    max_name_length = 18,
    max_prefix_length = 16, -- prefix used when a buffer is deduplicated
    tab_size = 20,
    diagnostics = false,
    show_buffer_close_icons = true,
    persist_buffer_sort = true,
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'extension'
  }
}
