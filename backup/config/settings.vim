" Config

autocmd BufWritePre * %s/\s\+$//e " Automatically stip whitespace upon write

" Clipboard setup
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
else
  set clipboard=unnamed
endif

" Backups
set backup
set noswapfile
set writebackup
set backupdir=~/.config/nvim/.backupdir//

if !isdirectory($HOME . "/.config/nvim/.backupdir")
  call mkdir($HOME . "/.config/nvim/.backupdir", "p")
endif

" Undo
if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile
  else
    if !isdirectory($HOME . "/.config/nvim/.undodir")
      call mkdir($HOME . "/.config/nvim/.undodir", "p")
    endif
    set undofile                          " Uses file(s) to store undo data, this allow persistence
    set undodir=~/.config/nvim/.undodir//
    set undolevels=500                    " Maximum number of changes that can be undone
    set undoreload=500                    " Maximum number lines to save for undo on a buffer reload
  endif
endif


" ShaDA - shared data - Neovim's viminfo equivilent
" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if exists('$SUDO_USER')
  if has('nvim')
    set shada=
  else
    set viminfo=
  endif
else
  if has('nvim')
    set shada=!,'250,:100,/100,<50,s10,h,c
  else
    set viminfo=!,'250,<50,s10,h,n$VARPATH/viminfo
  endif
endif

set title        " set terminal title
set titlestring =NVIM:\ %f

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

" Wildmenu
set wildmenu
set wildmode=list,full

" Visual
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
au VimEnter * colorscheme cleareye
hi Comment cterm=italic
set background=dark                     " Dark background is prefered
set number                              " displays current line number on the line the cursor is on
set relativenumber
set numberwidth=2
set signcolumn=yes:1                   " Allows characters to be rendered in side column
set cmdheight=1                         " Rows at bottom reserved for command, command outputs
set redrawtime=200
syntax on
set fillchars+=vert:│
" set inccommand=nosplit
set noshowmode
set cursorline
set colorcolumn=80

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
set foldlevel=2				                  " Close folds
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Misc
set virtualedit=onemore                 " Allows the cursor to move one column past the end of the row
set nowrap                              " disable wrapping
set mouse=a                             " enables mouse and scroll wheel
set magic                               " More characters available for commands
set noconfirm                           " starts a confim prompt
set updatetime=10
set backspace=indent,eol,start
set timeoutlen=500                      " Time in miliseconds to complete a mapped sequence
set whichwrap+=h,l
set noerrorbells                        " No annoying audio bell
set novisualbell                        " No annoying visual bell

set shortmess=aosTAI

set formatoptions+=t
set formatoptions+=c
set formatoptions-=r
set formatoptions-=o
set formatoptions-=r

if !has('nvim')
  set ttyfast " faster redrawing
endif
