" Keybinds
let g:mapleader = " "            " Sets space as the leader key

" When navigating lines and use visual lines instead of 'logical' lines.
nnoremap k gk
nnoremap j gj

" allows you to isnert new lines below the current cursor line
map <Enter> o<ESC>

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

" let g:which_key_map['*'] = [ ':call Comment()'                    , '' ]

let g:which_key_map.T = {
  \ 'name' : 'Telescope' ,
  \ 'r' : ['TelescopeLiveGrep'        , 'ripgrep'],
  \ 'f' : ['TelescopeFindFile'       , 'files'],
  \ 'g' : ['TelescopeFindGitFile'           , 'git'],
  \ }

call which_key#register('<Space>', "g:which_key_map")

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler 
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler 
