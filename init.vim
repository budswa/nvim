"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Vim-plug and plugins
" Install vim-plug if not already installed 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Plugins 
call plug#begin('~/.config/nvim/autoload/plugged')

" Colorschemes
Plug 'romgrk/doom-one.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'bluz71/vim-moonfly-colors'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'sainnhe/sonokai'
Plug 'kyazdani42/blue-moon'
Plug 'mhartington/oceanic-next'
Plug 'glepnir/zephyr-nvim'

" indentLine - lines showing indentation levels 
Plug 'Yggdroot/indentLine'
source $HOME/.config/nvim/config/indentline.vim

" vim-which-key - interface for leader key
Plug 'liuchengxu/vim-which-key'

" nvim web devicons
Plug 'kyazdani42/nvim-web-devicons'


" rainbow - rainbow brakets
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" vim-smoothie - smooth scrolling 
Plug 'psliwka/vim-smoothie'

" Highlights every other instance of the word under cursor
Plug 'itchyny/vim-cursorword'

" Quick-scope - f F t T enhancements 
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" clever-f
Plug 'rhysd/clever-f.vim'

" vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'path_html': '~/Documents/vimwiki/html', 'ext': '.wiki'}]

" neotex - LaTeX live preview
Plug 'donRaphaco/neotex', { 'for': 'tex' }

" Vista - tagbar explorer 
Plug 'liuchengxu/vista.vim'
source $HOME/.config/nvim/config/vista.vim

" Undotree - built-in undo tree visualizer 
Plug 'mbbill/undotree'
source $HOME/.config/nvim/config/undotree.vim

" vim-startuptime - startup time monitor
Plug 'dstein64/vim-startuptime'

" Vim-repeat - . to redo commands
Plug 'tpope/vim-repeat'

" Vim-sneak - 'sneaking'
Plug 'justinmk/vim-sneak'

" vim-sandwich - surround alternative 
Plug 'machakann/vim-sandwich'

" vim-move - move visually selected text 
Plug 'matze/vim-move'

" vim-commentary - commenting keybinds
Plug 'tpope/vim-commentary'

" vim-lastplace - persistent cursor placement
Plug 'farmergreg/vim-lastplace'
source $HOME/.config/nvim/config/lastplace.vim

" splitjoin - allows you to 'expand' code
Plug 'AndrewRadev/splitjoin.vim'

" vim-expand-region - expand visually selected text by objects
Plug 'terryma/vim-expand-region'

" textobj-word-column - adds text-objects for word-based columns
Plug 'coderifous/textobj-word-column.vim'

" Targets.vim - great text object plugin for movements etc...
Plug 'wellle/targets.vim'

" vim-highlightedyank - highlights yanks temporarily 
Plug 'machakann/vim-highlightedyank'

" vim-cool - after searching disables search highlighting
Plug 'romainl/vim-cool'

" vim-pasta - pasting support 
Plug 'sickill/vim-pasta'

" vim-rooter - sets root directory to vcs root
Plug 'airblade/vim-rooter'

" vim-bbye
Plug 'moll/vim-bbye'

" vim-fugitive - git intergration 
Plug 'tpope/vim-fugitive'

" vim-matchup
Plug 'andymass/vim-matchup'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" vim-signify - shows diffs with the signcol
Plug 'mhinz/vim-signify'
source $HOME/.config/nvim/config/signify.vim

" nvim-tree.lua  - filetree
Plug 'kyazdani42/nvim-tree.lua'
source $HOME/.config/nvim/config/nvim-tree.vim

" nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

" lsp_extensions
Plug 'tjdevries/lsp_extensions.nvim'

" Completion, snippets and snippet engine 
Plug 'nvim-lua/completion-nvim'
  Plug 'steelsojka/completion-buffers'
  Plug 'nvim-treesitter/completion-treesitter'
Plug 'hrsh7th/vim-vsnip'
  Plug 'honza/vim-snippets'
source $HOME/.config/nvim/config/completion-nvim.vim

" telescope.nvim
Plug 'nvim-lua/telescope.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

" nvim treesitter - NEED TO CONFIG
Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" barbar.nvim
Plug 'romgrk/barbar.nvim'
  Plug 'romgrk/lib.kom'

" galaxyline.nvim
Plug 'glepnir/galaxyline.nvim'

" Startify 
Plug 'mhinz/vim-startify'
source $HOME/.config/nvim/config/startify.vim

call plug#end()

" Basic configurations
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/keys.vim 

" Plugin configs based in lua
source $HOME/.config/nvim/config/barbar.vim

lua require ('galaxy')
lua require ('lsp-config')
lua require ('treesitter')
