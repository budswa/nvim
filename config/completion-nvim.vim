" Configure the completion chains
let g:completion_chain_complete_list = {
  \ 'default' : {
  \   'default': [
  \       {'complete_items': ['lsp','buffers','path','snippet','ts']},
  \       {'mode': '<c-p>'},
  \       {'mode': '<c-n>'}],
  \   'comment': [],
  \   'string': []
  \   }
  \}

" let g:completion_chain_complete_list = {
"   \'default' : {
"   \	'default' : [
"   \		{'complete_items' : ['lsp', 'snippet', 'buffers']},
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
let g:completion_matching_stratergy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_signature = 1
let g:completion_matching_ignore_case = 1
let g:completion_enable_snippet = 'vim-vsnip'
set completeopt=menuone,preview,noinsert

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
