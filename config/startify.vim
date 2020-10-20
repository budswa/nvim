let g:startify_custom_header = []
let g:startify_session_dir = '~/.config/nvim/sessions/'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['       MRU']                         },
    \ { 'type': 'dir',       'header': ['       Current Directory'. getcwd()] },
    \ { 'type': 'sessions',  'header': ['       Sessions']                    },
    \ { 'type': 'bookmarks', 'header': ['       Bookmarks']                   },
    \ ]
let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 'x': '~/.xmonad/xmonad.hs' },
    \ { 'b': '~/.xmonad/xmobarrc' },
    \ { 'w': '~/vimwiki/' },
    \ { 'z': '~/.zshrc' },
    \ '~/.config/']

