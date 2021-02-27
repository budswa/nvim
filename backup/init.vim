"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

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

" Basic configurations - to be loaded first
source $HOME/.config/nvim/config/settings.vim

" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" Language specific plugins

" Lua
Plug 'tjdevries/nlua.nvim'
Plug 'euclidianAce/BetterLua.vim'

" polyglot - for syntax highlighting support
Plug 'sheerun/vim-polyglot'

" Other plugins
" vim-which-key - interface for leader key
Plug 'liuchengxu/vim-which-key'

" Startify - nvim
Plug 'mhinz/vim-startify'

" vim-inyoface - for showing comments
Plug 'tjdevries/vim-inyoface'

" bbye - bufferbye, used for managing buffers and window structure
Plug 'moll/vim-bbye'

" vim-apm
Plug 'ThePrimeagen/vim-apm'

" indent-blankline.nvim
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
source $HOME/.config/nvim/config/indentline.vim

" clever-f
Plug 'rhysd/clever-f.vim'

" vim-altscreen - virtual screen doesn't cause visual glitches
Plug 'fcpg/vim-altscreen'

" Vista - tagbar explorer
Plug 'liuchengxu/vista.vim'
source $HOME/.config/nvim/config/vista.vim

" Undotree - built-in undo tree visualizer
Plug 'mbbill/undotree'
source $HOME/.config/nvim/config/undotree.vim

" vim-startuptime - startup time monitor
Plug 'dstein64/vim-startuptime'

" highlightyank - highlights yanked text for a moment
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 500

" Vim-repeat - . to redo commands
Plug 'tpope/vim-repeat'

" Vim-sneak - 'sneaking'
Plug 'justinmk/vim-sneak'

" vim-sandwich - surround alternative
Plug 'machakann/vim-sandwich'

" vim-move - move visually selected text
Plug 'matze/vim-move'

" splitjoin - allows you to 'expand' code
Plug 'AndrewRadev/splitjoin.vim'

" vim-hexokinase
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
source $HOME/.config/nvim/config/hexokinase.vim

" vim-characterize - pressing 'ga'  on a character reveals its value in hex
Plug 'tpope/vim-characterize'

" vim-abolish
Plug 'tpope/vim-abolish'

" Goyo.vim - disraction free writing
Plug 'junegunn/goyo.vim'

" Targets.vim - great text object plugin for movements etc...
Plug 'wellle/targets.vim'

" vim-cool - after searching disables search highlighting
Plug 'romainl/vim-cool'

" vim-illuminate - illuminate all visable instances of word under cursor
Plug 'RRethy/vim-illuminate'

" vim-rooter - sets root directory to vcs root
Plug 'airblade/vim-rooter'

" vim-fugitive - git intergration
Plug 'tpope/vim-fugitive'

" Tabular - align text
Plug 'godlygeek/tabular'

" Anyjump
Plug 'pechorin/any-jump.vim'

" NrrwRgn - Emacs narrowing for vim
Plug 'chrisbra/NrrwRgn'

" traces.vim - range, pattern and substitute preview for Vim
Plug 'markonm/traces.vim'

" nvim-ts-rainbow - treesitter compata
Plug 'p00f/nvim-ts-rainbow'

" gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'

" instant.nvim - colab
Plug 'jbyuki/instant.nvim'
let g:instant_username = "m2"

" Sidekick
Plug 'ElPiloto/sidekick.nvim'

" minimap.vim - minimap built on code-minimap
Plug 'wfxr/minimap.vim'

" FTerm.nvim - floating terminal built in Lua
Plug 'numtostr/FTerm.nvim'

" toggleterm
Plug 'akinsho/nvim-toggleterm.lua'

" Iron.nvim - interactive repls for whatever language
Plug 'hkupty/iron.nvim'

" auto-pairs
Plug 'windwp/nvim-autopairs'

" architext.nvim - structural editing plugin for Neovim
Plug 'vigoux/architext.nvim'

" sql.nvim - sql bindings for nvim
Plug 'tami5/sql.nvim'

" dial.nvim - extended increment/decrement
Plug 'monaqa/dial.nvim'

" nvim-autospace
Plug 'windwp/nvim-autospace'

" Formatter.nvim - a format runner for neovime written in Lua
Plug 'mhartington/formatter.nvim'

" nvim-tree.lua  - filetree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
source $HOME/.config/nvim/config/nvimtree.vim

" kommentary - commenting keybinds
Plug 'b3nj5m1n/kommentary'

" nvim-compe
Plug 'hrsh7th/nvim-compe'

" complextras
Plug 'tjdevries/complextras.nvim'

" nvim-lightbulb
Plug 'kosayoda/nvim-lightbulb'

" lspsaga.nvim
Plug 'glepnir/lspsaga.nvim'

" lspkind-nvim - shows the result type of lsp results in completion window
Plug 'onsails/lspkind-nvim'

" lspinstall
Plug 'anott03/nvim-lspinstall'

" lspupdate
Plug 'alexaandru/nvim-lspupdate'

" nvim-lspconfig
Plug 'neovim/nvim-lspconfig'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'nvim-lua/lsp_extensions.nvim'

" nvim-cursorline
Plug 'yamatsum/nvim-cursorline'

" Completion, snippets and snippet engine
Plug 'nvim-lua/completion-nvim'
  Plug 'steelsojka/completion-buffers'
Plug 'hrsh7th/vim-vsnip'
  Plug 'honza/vim-snippets'

" telescope.nvim
Plug 'nvim-lua/telescope.nvim'
  " Plug 'nvim-telescope/telescope-packer.nvim' NEED PACKER.NVIM TO WORK
  Plug 'nvim-telescope/telescope-symbols.nvim'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

" nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/completion-treesitter'
  Plug 'nvim-treesitter/playground'

" barbar.nvim
Plug 'romgrk/barbar.nvim'
source $HOME/.config/nvim/config/barbar.vim

" vlog.nvim
Plug 'tjdevries/vlog.nvim'

" nsync.nvim
Plug 'tjdevries/nsync.nvim'

" Train.nvim - train yourself the vim motion keybinds
Plug 'tjdevries/train.nvim'

" galaxyline.nvim
Plug 'glepnir/galaxyline.nvim'

call plug#end()

" Keybinds
source $HOME/.config/nvim/config/keys.vim

lua require ('init')
