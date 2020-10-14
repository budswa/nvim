let g:lua_tree_width = 32
let g:lua_tree_auto_open = 0
let g:lua_tree_auto_close = 1
let g:lua_tree_follow = 1
let g:lua_tree_indent_markers = 1
let g:lua_tree_icons = {
    \ 'git': {
    \   'unstaged': "U",
    \   'staged': "S",
    \   'unmerged': "",
    \   }
    \ }

nnoremap <leader>E :LuaTreeToggle<CR>

