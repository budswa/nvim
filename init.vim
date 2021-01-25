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


Plug 'sheerun/vim-polyglot'

" Other plugins
" vim-which-key - interface for leader key
Plug 'liuchengxu/vim-which-key'

" Startify - nvim
Plug 'mhinz/vim-startify'

" vimwiki - note taking plugin for vim
Plug 'vimwiki/vimwiki'
source $HOME/.config/nvim/config/vimwiki.vim

" vim-inyoface - for showing comments
Plug 'tjdevries/vim-inyoface'

" bbye - bufferbye, used for managing buffers and window structure
Plug 'moll/vim-bbye'

" vim-godot - godot game engine support and syntax
Plug 'habamax/vim-godot'

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

" Gist.vim
Plug 'mattn/webapi-vim'
  Plug 'mattn/vim-gist'

" vim-sandwich - surround alternative
Plug 'machakann/vim-sandwich'

" vim-move - move visually selected text
Plug 'matze/vim-move'

" vim-commentary - commenting keybinds
Plug 'tpope/vim-commentary'

" splitjoin - allows you to 'expand' code
Plug 'AndrewRadev/splitjoin.vim'

" vim-hexokinase
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
source $HOME/.config/nvim/config/hexokinase.vim

" vim-expand-region - expand visually selected text by objects
Plug 'terryma/vim-expand-region'

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

" vim-matchup
Plug 'andymass/vim-matchup'

" gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'

" vim-signify - shows diffs with the signcol
" Plug 'mhinz/vim-signify'
" let g:signify_sign_add               = '+'
" let g:signify_sign_delete            = '-'
" let g:signify_sign_change            = '!'

" minimap.vim - minimap built on code-minimap
Plug 'wfxr/minimap.vim'

" FTerm.nvim - floating terminal built in Lua
Plug 'numtostr/FTerm.nvim'

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

" Formatter.nvim - a format runner for neovime written in Lua
Plug 'mhartington/formatter.nvim'

" nvim-tree.lua  - filetree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
source $HOME/.config/nvim/config/nvimtree.vim

" nvim-lspconfig
Plug 'neovim/nvim-lspconfig'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'nvim-lua/lsp_extensions.nvim'

" Completion, snippets and snippet engine
Plug 'nvim-lua/completion-nvim'
  Plug 'steelsojka/completion-buffers'
Plug 'hrsh7th/vim-vsnip'
  Plug 'honza/vim-snippets'
source $HOME/.config/nvim/config/completion.vim

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

" galaxyline.nvim
Plug 'glepnir/galaxyline.nvim'

call plug#end()

" Keybinds
source $HOME/.config/nvim/config/keys.vim

" Plugin configs based in lua
lua require ('galaxy')
lua require ('lsp-config')
lua require ('treesitter')
lua require ('telescope')
lua require ('format')
lua require ('gitsigns')
lua require ('nvim-autopairs').setup()
