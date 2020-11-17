" Keybinds
let g:mapleader = " "            " Sets space as the leader key

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

let g:which_key_map['E'] = [ ':LuaTreeToggle',    'LuaTree' ]
let g:which_key_map['n'] = [ ':new'               , 'new file' ]
let g:which_key_map['u'] = [ ':UndoTreeToggle' , 'undotree' ]

let g:which_key_map.b = {
  \ 'name' : 'Buffer'
  \ }

let g:which_key_map.w = {
  \ 'name' : 'Vimwiki',
  \ 'w' : ['VimwikiIndex', 'Index']
  \ }

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
let g:which_key_map.s = {
  \ 'name' : 'Session',
  \ 's' : [':SessionSave', 'Session save'],
  \ 'l' : [':SessionLoad', 'Session load']
  \ }

let g:which_key_map.t = {  
  \ 'name' : 'Telescope' ,
  \ 'r' : [':Telescope live_grep',            'ripgrep'],
  \ 'c' : [':Telescope commands',            'commands'],
  \ 'h' : [':Telescope command_history',            'history'],
  \ 'f' : [':Telescope fd',              'files'],
  \ 'F' : [':Telescope current_buffer_fuzzy_find',              'buffer rg'],
  \ 'g' : [':Telescope git_files',             'git files'],
  \ 'b' : [':Telescope buffers',             'buffers'],
  \ 'B' : [':Telescope builtin',             'builtin'],
  \ 'R' : [':Telescope reloader',             'reloader'],
  \ 'o' : [':Telescope vim_options',             'vim options'],
  \ 't' : [':Telescope treesitter',             'treesitter'],
  \ 'C' : [':Telescope colorscheme',             'colorscheme'],
  \ 'p' : [':Telescope planets',             'planets'],
  \ }

call which_key#register('<Space>', "g:which_key_map")

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler 
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler 
