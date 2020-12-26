" Keybinds
let g:mapleader = " "            " Sets space as the leader key

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better indenting/tabbing
vnoremap < <gv
vnoremap > >gv

" When navigating lines and use visual lines instead of 'logical' lines.
nnoremap k gk
nnoremap j gj

" Saving and updating with Ctrl-s and Ctrl-S respectively
noremap <silent> <C-s> :write<CR>
noremap <silent> <C-S> :update<CR>

nnoremap <leader>W :write<CR>

" Which-key mappings 
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<space>'<cr>
vnoremap <silent> <leader> :silent <c-u> :silent whichkeyvisual '<space>'<cr>

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single key bindings
let g:which_key_map['/'] = [ ':call Comment()'                    , 'comment']
let g:which_key_map['.'] = [ ':e $MYVIMRC'                        , 'open init']
let g:which_key_map[';'] = [ ':Telescope commands'                , 'commands']
let g:which_key_map['='] = [ '<C-W>='                             , 'balance windows']
let g:which_key_map['d'] = [ ':Bdelete'                           , 'delete buffer']
let g:which_key_map['E'] = [ ':LuaTreeToggle'                     , 'LuaTree']
let g:which_key_map['h'] = [ '<C-W>s'                             , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'                             , 'split right']
let g:which_key_map['f'] = [ ':Telescope find_files'              , 'search files' ]
let g:which_key_map['n'] = [ ':new'                               , 'new file' ]
let g:which_key_map['U'] = [ ':UndoTreeToggle'                    , 'undotree' ]

" a = actions
let g:which_key_map.a = {
    \ 'name' : '+actions' ,
    \ 'c' : [':ColorizerToggle'         , 'colorizer'],
    \ 'w' : [':StripWhitespace'         , 'strip whitespace'],
    \ }

" b = buffer
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ 'd' : [':Bdelete'  , 'delete-buffer'],
    \ 'D' : [':BufOnly'  , 'delete all but current'],
    \ 'f' : ['bfirst'    , 'first-buffer'],
    \ 'h' : ['Startify'  , 'home-buffer'],
    \ 'l' : ['blast'     , 'last-buffer'],
    \ 'n' : ['bnext'     , 'next-buffer'],
    \ 'p' : ['bprevious' , 'previous-buffer'],
    \ }

" f = find
let g:which_key_map.f = {
  \ 'name' : '+find' ,
  \ 'b' : [':Telescope buffers'         , 'open buffers'],
  \ 'c' : [':Telescope git_commits'     , 'project commits'],
  \ 'C' : [':Telescope git_bcommits'    , 'buffer commits'],
  \ 'f' : [':Telescope find_files'      , 'files'],
  \ 'g' : [':Telescope live_grep'       , 'grep file'],
  \ 'G' : [':Telescope git_files'       , 'git files'],
  \ 'h' : [':Telescope command_history' , 'command history'],
  \ 'm' : [':Telescope marks'           , 'marks'] ,
  \ 'k' : [':Telescope keymaps'         , 'keymaps'] ,
  \ 't' : [':Telescope tags'            , 'project tags'],
  \ 's' : [':Telescope symbols'         , 'symbols'],
  \ 'S' : [':Telescope colorscheme'     , 'color schemes'],
  \ 'y' : [':Telescope filetypes'       , 'file types'],
  \ }

" S = Session
let g:which_key_map.S = {
  \ 'name' : '+Session' ,
  \ 'l' : [':SessionLoad'           , 'load session'],
  \ 's' : [':SessionSave'           , 'save session'],
  \ }

" g = Git
let g:which_key_map.g = {
    \ 'name' : '+git' ,
    \ 'a' : [':Git add .'                        , 'add all'],
    \ 'A' : [':Git add %'                        , 'add current'],
    \ 'b' : [':Git blame'                        , 'blame'],
    \ 'B' : [':GBrowse'                          , 'browse'],
    \ 'c' : [':Git commit'                       , 'commit'],
    \ 'C' : [':GCheckout'                        , 'checkout'],
    \ 'd' : [':Git diff'                         , 'diff'],
    \ 'D' : [':Gdiffsplit'                       , 'diff split'],
    \ 'g' : [':GGrep'                            , 'git grep'],
    \ 'G' : [':Gstatus'                          , 'status'],
    \ 'h' : [':GitGutterLineHighlightstoggle'    , 'highlight hunks'],
    \ 'H' : ['<Plug>(GitGutterPreviewhunk)'      , 'preview hunk'],
    \ 'i' : [':Gist -b'                          , 'post gist'],
    \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
    \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
    \ 'l' : [':Git log'                          , 'log'],
    \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
    \ 'p' : [':Git push'                         , 'push'],
    \ 'P' : [':Git pull'                         , 'pull'],
    \ 'r' : [':GRemove'                          , 'remove'],
    \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
    \ 'S' : [':!git status'                      , 'status'],
    \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
    \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
    \ 'v' : [':GV'                               , 'view commits'],
    \ 'V' : [':GV!'                              , 'view buffer commits'],
    \ }

" G = Gist
let g:which_key_map.G = {
    \ 'name' : '+gist' ,
    \ 'a' : [':Gist -a'                          , 'post gist anon'],
    \ 'b' : [':Gist -b'                          , 'post gist browser'],
    \ 'd' : [':Gist -d'                          , 'delete gist'],
    \ 'e' : [':Gist -e'                          , 'edit gist'],
    \ 'l' : [':Gist -l'                          , 'list public gists'],
    \ 's' : [':Gist -ls'                         , 'list starred gists'],
    \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
    \ 'p' : [':Gist -P'                          , 'post public gist '],
    \ 'P' : [':Gist -p'                          , 'post private gist '],
    \ }

" l = language server protocol (LSP)
let g:which_key_map.l = {
    \ 'name' : '+lsp' ,
    \ '.' : [':CocConfig'                          , 'config'],
    \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
    \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
    \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
    \ 'b' : [':CocNext'                            , 'next action'],
    \ 'B' : [':CocPrev'                            , 'prev action'],
    \ 'c' : [':CocList commands'                   , 'commands'],
    \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
    \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
    \ 'e' : [':CocList extensions'                 , 'extensions'],
    \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
    \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
    \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
    \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
    \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
    \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
    \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
    \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
    \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
    \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
    \ 'O' : [':CocList outline'                    , 'outline'],
    \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
    \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
    \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
    \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
    \ 'R' : ['<Plug>(coc-references)'              , 'references'],
    \ 's' : [':CocList -I symbols'                 , 'references'],
    \ 'S' : [':CocList snippets'                   , 'snippets'],
    \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
    \ 'u' : [':CocListResume'                      , 'resume list'],
    \ 'U' : [':CocUpdate'                          , 'update CoC'],
    \ 'z' : [':CocDisable'                         , 'disable CoC'],
    \ 'Z' : [':CocEnable'                          , 'enable CoC'],
    \ }

call which_key#register('<Space>', "g:which_key_map")
