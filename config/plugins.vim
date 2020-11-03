" Install vim-plug if not already installed 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins 
call plug#begin('~/.config/nvim/autoload/plugged')

" doom-one
Plug 'romgrk/doom-one.vim'

" Lightline and gitbranch for lightline 
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'

" galaxyline
Plug 'glepnir/galaxyline.nvim'

" barbar.nvim
Plug 'romgrk/barbar.nvim'
Plug 'romgrk/lib.kom'

" vimade - dims inactive windows
Plug 'TaDaa/vimade'

" indentLine - lines showing indentation levels 
Plug 'Yggdroot/indentLine'

" Startify - home page plugin
Plug 'mhinz/vim-startify'

" vim-which-key - interface for leader key
Plug 'liuchengxu/vim-which-key'

" nvim web devicons
Plug 'kyazdani42/nvim-web-devicons'

" nvim-tree.lua  - filetree
Plug 'kyazdani42/nvim-tree.lua'

" rainbow - rainbow brakets
Plug 'luochen1990/rainbow'

" vim-smoothie - smooth scrolling 
Plug 'psliwka/vim-smoothie'

" Highlights every other instance of the word under cursor
Plug 'itchyny/vim-cursorword'

" nvim-colorizer.lua - highlights hex and rgb colors with their colors 
Plug 'norcalli/nvim-colorizer.lua'

" Quick-scope - f F t T enhancements 
Plug 'unblevable/quick-scope'

" clever-f
Plug 'rhysd/clever-f.vim'

" vimwiki
Plug 'vimwiki/vimwiki'

" Vista - tagbar explorer 
Plug 'liuchengxu/vista.vim'

" vim-floaterm - floating terminal window for shell usage
Plug 'voldikss/vim-floaterm'

" Undotree - built-in undo tree visualizer 
Plug 'mbbill/undotree'

" Any-jump - definitions and references floating window 
Plug 'pechorin/any-jump.vim'

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

" goyo.vim
Plug 'junegunn/goyo.vim'

" vim-commentary - commenting keybinds
Plug 'tpope/vim-commentary'

" vim-lastplace - persistent cursor placement
Plug 'farmergreg/vim-lastplace'

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

" emmet-vim - emmet, for vim 
Plug 'mattn/emmet-vim'

" UltiSnips
Plug 'sirver/UltiSnips'

" vim-snippets - snippet pack
Plug 'honza/vim-snippets'

" vim-fugitive - git intergration 
Plug 'tpope/vim-fugitive'

" vim-matchup
Plug 'andymass/vim-matchup'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" vim-signify - shows diffs with the signcol
Plug 'mhinz/vim-signify'

" nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

" lsp-status
Plug 'nvim-lua/lsp-status.nvim'

" lsp_extensions
Plug 'tjdevries/lsp_extensions.nvim'

" completion-treesitter
Plug 'nvim-treesitter/completion-treesitter'

" completion-nvim - native: nvim completion
Plug 'nvim-lua/completion-nvim'

" completion-buufers
Plug 'steelsojka/completion-buffers'

" diagnostic-nvim 
Plug 'nvim-lua/diagnostic-nvim'

" popup.nvim
Plug 'nvim-lua/popup.nvim'

" planetary.nvim
Plug 'nvim-lua/plenary.nvim'

" telescope.nvim
Plug 'nvim-lua/telescope.nvim'

" nvim treesitter - NEED TO CONFIG
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

call plug#end()

" Install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
