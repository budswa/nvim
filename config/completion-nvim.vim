let g:completion_matching_stratergy_list = ['exact', 'substring', 'fuzzy']

autocmd BufEnter * lua require'completion'.on_attach()

let g:builtin_lsp = v:true

let g:completion_enable_auto_popup = 1

" Configure the completion chains
let g:completion_chain_complete_list = [{'complete_items': ['lsp', 'ts', 'snippet']} ]
" let g:completion_chain_complete_list = {
"   \'default' : {
"   \	'default' : [
"   \		{'complete_items' : ['lsp', 'snippet', 'buffers', 'ts']},
"   \		{'mode' : 'file'}
"   \	],
"   \	'comment' : [],
"   \	'string' : []
"   \	},
"   \'vim' : [
"   \	{'complete_items': ['lsp', 'snippet', 'buffers', 'ts']},
"   \	{'mode' : 'cmd'}
"   \	],
"   \'python' : [
"   \	{'complete_items': ['lsp', 'snippet', 'buffers', 'ts']}
"   \	],
"   \'lua' : [
"   \	{'complete_items': ['lsp', 'snippet', 'buffers', 'ts']}
"   \	],
"   \ 'go' : [
"   \	{'complete_items': ['lsp', 'snippet', 'buffers', 'ts']}
"   \	],
"   \}

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <silent> <c-p> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,preview,noinsert

let g:completion_enable_snippet = 'UltiSnips'
