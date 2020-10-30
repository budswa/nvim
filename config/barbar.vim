nnoremap <silent> <Leader>bp :<C-u>BufferPick<CR>
nnoremap <silent> <Leader>bd :<C-u>BufferOrderByDirectory<CR>
nnoremap <silent> <Leader>bl :<C-u>BufferOrderByLanguage<CR>

nnoremap <silent> <A-,> :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext    <CR>
nnoremap <silent> <A-1> :BufferGoto 1  <CR>
nnoremap <silent> <A-2> :BufferGoto 2  <CR>
nnoremap <silent> <A-3> :BufferGoto 3  <CR>
nnoremap <silent> <A-4> :BufferGoto 4  <CR>
nnoremap <silent> <A-5> :BufferGoto 5  <CR>
nnoremap <silent> <A-6> :BufferGoto 6  <CR>
nnoremap <silent> <A-7> :BufferGoto 7  <CR>
nnoremap <silent> <A-8> :BufferGoto 8  <CR>
nnoremap <silent> <A-9> :BufferLast		 <CR>

let bufferline = {}
let bufferline.shadow = v:false
let bufferline.clickable = v:true
let bufferline.icons = v:true
let bufferline.semantic_letters = v:true
