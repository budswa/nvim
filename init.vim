"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Reload init.vim upon it being modified
autocmd bufwritepost init.vim source $MYVIMRC

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
Plug 'sainnhe/sonokai'
Plug 'kyazdani42/blue-moon'
Plug 'glepnir/zephyr-nvim'

" vim-which-key - interface for leader key
Plug 'liuchengxu/vim-which-key'

" nvim web devicons

Plug 'moll/vim-bbye'

" clever-f
Plug 'rhysd/clever-f.vim'

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

" vim-tmux
Plug 'tmux-plugins/vim-tmux'

" Gist.vim
Plug 'mattn/webapi-vim'
  Plug 'mattn/vim-gist'

" vim-sandwich - surround alternative 
Plug 'machakann/vim-sandwich'

" vim-move - move visually selected text 
Plug 'matze/vim-move'

" vim-commentary - commenting keybinds
Plug 'tpope/vim-commentary'

" vim-lastplace - persistent cursor placement
Plug 'farmergreg/vim-lastplace'
let g:lastplace_ignore = "gitcommit,gitrebase,svn"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" splitjoin - allows you to 'expand' code
Plug 'AndrewRadev/splitjoin.vim'

" vim-expand-region - expand visually selected text by objects
Plug 'terryma/vim-expand-region'

" Targets.vim - great text object plugin for movements etc...
Plug 'wellle/targets.vim'

" vim-cool - after searching disables search highlighting
Plug 'romainl/vim-cool'

" vim-pasta - pasting support 
Plug 'sickill/vim-pasta'

" vim-rooter - sets root directory to vcs root
Plug 'airblade/vim-rooter'

" vim-fugitive - git intergration 
Plug 'tpope/vim-fugitive'

" vim-matchup
Plug 'andymass/vim-matchup'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" vim-signify - shows diffs with the signcol
Plug 'mhinz/vim-signify'
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_change            = '!'

" minimap.vim - minimap built on code-minimap
Plug 'wfxr/minimap.vim'

" FTerm.nvim - floating terminal built in Lua
Plug 'numtostr/FTerm.nvim'

" nvim-tree.lua  - filetree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
source $HOME/.config/nvim/config/nvimtree.vim

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
source $HOME/.config/nvim/config/completion.vim

" telescope.nvim
Plug 'nvim-lua/telescope.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'
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

" Dashboard-nvim
Plug 'glepnir/dashboard-nvim'
source $HOME/.config/nvim/config/dashboard.vim

call plug#end()

" Basic configurations
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/keys.vim 

" Plugin configs based in lua
source $HOME/.config/nvim/config/barbar.vim

lua require ('galaxy')
lua require ('lsp-config')
lua require ('treesitter')
