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
set swapfile
set writebackup
set backupdir=~/.config/nvim/backupdir//

if !isdirectory($HOME . "/.config/nvim/backupdir")
    call mkdir($HOME . "/.config/nvim/backupdir", "p")
endif

" Undo
if has('persistent_undo')
    set undofile                        " Uses file(s) to store undo data, this allow persistence
    set undodir=~/.config/nvim/undodir//
    set undolevels=500                  " Maximum number of changes that can be undone
    set undoreload=500                  " Maximum number lines to save for undo on a buffer reload
endif

if !isdirectory($HOME . "/.config/nvim/undodir")
    call mkdir($HOME . "/.config/nvim/undodir", "p")
endif

" File settings
set encoding=utf-8                      " sets the file encoding to utf-8
filetype on                             " allows filetype detection
filetype plugin on                      " allows plugin specific files for specific filetpyes
filetype indent on                      " allows filetype specific indentation loading
set autoread                            " automatically reads file changes from external changes

" New buffers
set splitright                          " When vertically splitting, always spawn new buffer on right
set splitbelow                          " When horizontally splitting, always spawn new buffer on bottom
set equalalways                         " When Splitting a buffer for a new buffer, always split equally

" Scrolling
set sidescroll=1                        " Smoothes horizontal scrolling
set sidescrolloff=3                     " Sidewards scrolloff
set scrolloff=1                         " Minimum lines to keep above and below cursor

" Searching
set ignorecase                          " Ignore case while searching
set smartcase                           " Ignore case while searching until capital entered
set incsearch                           " search while typing

" Visual
autocmd vimenter * colorscheme onedark  " sets the colorscheme
set background=dark                     " Dark background is prefered 
set number relativenumber               " displays line number next to line
set showmatch                           " Shows matching bracket in braket pair
set ruler                               " Shows column and row info
set signcolumn=yes                      " Allows characters to be rendered in side column
set lazyredraw                          " disables flickering during macros
set cmdheight=1                         " Rows at bottom reserved for command, command outputs
set termguicolors
syntax on
set fillchars+=vert:│

" Indent and tab behaviour
set noexpandtab                         " Expands tabs to spaces when deleting tabs
set autoindent                          " Copy indent level from previous line
set smartindent
set shiftwidth=2
set shiftround                          " When 'shifting', always shift to multiples of shiftwidth
set tabstop=2                           " An indentation every four columns
set softtabstop=2

" Folding
set nofoldenable                        " Enables folding
set foldmethod=manual		                " Only folds when manually set folds
set foldlevel=2					                " Close folds

" Misc
set virtualedit=onemore                 " Allows the cursor to move one column past the end of the row
set nowrap                              " disable wrapping
set mouse=a                             " enables mouse and scroll wheel
set magic                               " More characters available for commands
set confirm                             " starts a confim prompt
set updatetime=50                       " How often the window refreshes (for LSP I believe)
set wildmenu                            " Enables the wildmenu
set wildmode=list:longest,full          " Wildmenu settings
set wildoptions=tagfile
set shortmess+=c                        " Changes message/ warning behaviour
set backspace=indent,eol,start
set timeoutlen=500                      " Time in miliseconds to complete a mapped sequence
set whichwrap+=h,l
set noerrorbells                        " No annoying audio bell
set novisualbell                        " No annoying visual bell

" Hides the '~' on unused rows
autocmd vimenter * hi NonText guifg=bg

" Disables automatic commenting on newline
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o

