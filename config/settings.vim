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
    set shada=!,'300,<50,s10,h
  else
    set viminfo=!,'300,<50,s10,h,n$VARPATH/viminfo
  endif
endif

set title        " set terminal title
set titlestring   =NVIM:\ %f

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
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
au VimEnter * colorscheme zephyr
hi Comment cterm=italic
set background=dark                     " Dark background is prefered 
set number                              " displays current line number on the line the cursor is on
set numberwidth=1
set signcolumn=auto:3                      " Allows characters to be rendered in side column
set cmdheight=1                         " Rows at bottom reserved for command, command outputs
set redrawtime=200
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
set shortmess+=c                        " Changes message/ warning behaviour
set backspace=indent,eol,start
set timeoutlen=500                      " Time in miliseconds to complete a mapped sequence
set whichwrap+=h,l
set noerrorbells                        " No annoying audio bell
set novisualbell                        " No annoying visual bell

set formatoptions-=a    " Auto formatting is BAD.
set formatoptions-=t    " Don't auto format my code. I got linters for that.
set formatoptions+=c    " In general, I like it when comments respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions-=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " I'm not in gradeschool anymore
set nojoinspaces        " Two spaces and grade school, we're done

if !has('nvim')
  set ttyfast " faster redrawing
endif
