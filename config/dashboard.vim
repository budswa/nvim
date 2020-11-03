let g:dashboard_custom_shortcut= {
  \ 'new_file'           : 'SPC n',
  \ 'find_file'          : 'SPC t f',
  \ 'last_session'       : 'SPC s l',
  \ 'find_history'       : 'SPC f h',
  \ 'find_word'          : 'SPC t f',
  \ 'book_marks'         : 'SPC f b',
  \ }

let g:dashboard_default_executive = 'Telescope'

let g:dashboard_default_header = 'hydra'

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

