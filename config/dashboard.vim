let g:dashboard_default_executive = 'telescope'

let g:dashboard_default_header = 'hydra'

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

let g:dashboard_custom_shortcut = {
  \ 'new_file'           : 'SPC n  ',
  \ 'last_session'       : 'SPC s l',
  \ 'find_history'       : 'SPC f h',
  \ 'find_file'          : 'SPC f f',
  \ 'change_colorscheme' : 'SPC t c',
  \ 'find_word'          : 'SPC f a',
  \ 'book_marks'         : 'SPC f b',
  \ }
