" Config

" Clipboard setup
if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=unnamed
  endif
endif

" Backups
set backup
set noswapfile
set writebackup
set backupdir=~/.config/nvim/backupdir//

if !isdirectory($HOME . "/.config/nvim/backupdir")
  call mkdir($HOME . "/.config/nvim/backupdir", "p")
endif

" Undo
if has('persistent_undo')
  set undofile                          " Uses file(s) to store undo data, this allow persistence
  set undodir=~/.config/nvim/undodir//  
  set undolevels=500                    " Maximum number of changes that can be undone
  set undoreload=500                    " Maximum number lines to save for undo on a buffer reload
endif

if !isdirectory($HOME . "/.config/nvim/undodir")
  call mkdir($HOME . "/.config/nvim/undodir", "p")
endif

" File settings
set encoding=utf-8                      " sets the file encoding to utf-8
  filetype on                           " allows filetype detection
  filetype plugin on                    " allows plugin specific files for specific filetpyes
  filetype indent on                    " allows filetype specific indentation loading
set autoread                            " automatically reads file changes from external changes

" New buffers
set splitright                          " When vertically splitting, always spawn new buffer on right
set splitbelow                          " When horizontally splitting, always spawn new buffer on bottom
set noequalalways                       " When Splitting a buffer for a new buffer, always split equally

" Scrolling
set sidescroll=1                        " Smoothes horizontal scrolling
set sidescrolloff=3                     " Sidewards scrolloff
set scrolloff=1                         " Minimum lines to keep above and below cursor

" Searching
set ignorecase                          " Ignore case while searching
set smartcase                           " Ignore case while searching until capital entered
set incsearch                           " search while typing

" Visual
colorscheme doom-one
" autocmd vimenter * colorscheme onedark  " sets the colorscheme
set background=dark                     " Dark background is prefered 
set number                              " displays current line number on the line the cursor is on
set numberwidth=1
set signcolumn=yes                      " Allows characters to be rendered in side column
set cmdheight=1                         " Rows at bottom reserved for command, command outputs
set redrawtime=800
set termguicolors
syntax on
set fillchars+=vert:│
set inccommand=nosplit
set noshowmode
set cursorline

" Indent and tab behaviour
set expandtab                           " Expands tabs to spaces when deleting tabs
set autoindent                          " Copy indent level from previous line
set smartindent
set shiftwidth=2
set shiftround                          " When 'shifting', always shift to multiples of shiftwidth
set tabstop=2                           " An indentation every four columns
set softtabstop=2

" Folding
set nofoldenable                        " Enables folding
set foldmethod=manual		                " Only folds when manually set folds
set foldlevel=2				                  " Close folds

" Misc
set virtualedit=onemore                 " Allows the cursor to move one column past the end of the row
set nowrap                              " disable wrapping
set mouse=a                             " enables mouse and scroll wheel
set magic                               " More characters available for commands
set confirm                             " starts a confim prompt
set updatetime=10
set wildmenu                            " Enables the wildmenu
set wildmode=list:longest,full
set wildignorecase
set wildoptions=tagfile,pum
set shortmess+=c                        " Changes message/ warning behaviour
set backspace=indent,eol,start
set timeoutlen=500                      " Time in miliseconds to complete a mapped sequence
set whichwrap+=h,l
set noerrorbells                        " No annoying audio bell
set novisualbell                        " No annoying visual bell

" Hides the '~' on unused rows
autocmd vimenter * hi NonText guifg=bg

set formatoptions-=a    " Auto formatting is BAD.
set formatoptions-=t    " Don't auto format my code. I got linters for that.
set formatoptions+=c    " In general, I like it when comments respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions+=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " I'm not in gradeschool anymore
set nojoinspaces        " Two spaces and grade school, we're done
