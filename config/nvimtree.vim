let g:lua_tree_side = 'left'
let g:lua_tree_width = 30
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:lua_tree_auto_open = 0
let g:lua_tree_auto_close = 1
let g:lua_tree_quit_on_open = 0
let g:lua_tree_follow = 1
let g:lua_tree_indent_markers = 1
let g:lua_tree_hide_dotfiles = 0
let g:lua_tree_git_hl = 1
let g:lua_tree_tab_open = 0
let g:lua_tree_width_allow_resize  = 1
let g:lua_tree_show_icons = {
  \ 'git': 1,
  \ 'folders': 1,
  \ 'files': 1,
  \ }
let g:lua_tree_bindings = {
  \ 'edit':            ['<CR>', 'o'],
  \ 'edit_vsplit':     '<C-v>',
  \ 'edit_split':      '<C-x>',
  \ 'edit_tab':        '<C-t>',
  \ 'close_node':      ['<S-CR>', '<BS>'],
  \ 'toggle_ignored':  'I',
  \ 'toggle_dotfiles': 'H',
  \ 'refresh':         'R',
  \ 'preview':         '<Tab>',
  \ 'cd':              '<C-]>',
  \ 'create':          'a',
  \ 'remove':          'd',
  \ 'rename':          'r',
  \ 'cut':             'x',
  \ 'copy':            'c',
  \ 'paste':           'p',
  \ 'prev_git_item':   '[c',
  \ 'next_git_item':   ']c',
  \ }
let g:lua_tree_icons = {
  \ 'default': '',
  \ 'symlink': '',
  \ 'git': {
  \   'unstaged': "✗",
  \   'staged': "✓",
  \   'unmerged': "",
  \   'renamed': "➜",
  \   'untracked': "★"
  \   },
  \ 'folder': {
  \   'default': "",
  \   'open': "",
  \   'symlink': "",
  \   }
  \ }
highlight LuaTreeFolderIcon guibg=blue
