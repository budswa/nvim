" Install vim-plug if not already installed 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins 
call plug#begin('~/.config/nvim/autoload/plugged')

" Onedark colorscheme
Plug 'joshdick/onedark.vim' 

" Colorscheme pack
Plug 'flazz/vim-colorschemes'

" Lightline and gitbranch for lightline 
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" indentLine - lines showing indentation levels 
Plug 'Yggdroot/indentLine'

" Startify - home page plugin
Plug 'mhinz/vim-startify'

" vim-which-key - interface for leader key
Plug 'liuchengxu/vim-which-key'

" vim-devicons - adds nerd font support 
Plug 'ryanoasis/vim-devicons'

" nvim web devicons
Plug 'kyazdani42/nvim-web-devicons'

" nvim-tree.lua  - filetree
Plug 'kyazdani42/nvim-tree.lua'

" unicode stuff
Plug 'chrisbra/unicode.vim'

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

" Vista - tagbar explorer 
Plug 'liuchengxu/vista.vim'

" vim-floaterm - floating terminal window for shell usage
Plug 'voldikss/vim-floaterm'

" vim-peekaboo - menu to show registers 
Plug 'junegunn/vim-peekaboo'

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

" vim-commentary - commenting keybinds
Plug 'tpope/vim-commentary'

" vim-lastplace - persistent cursor placement
Plug 'farmergreg/vim-lastplace'

" splitjoin - allows you to 'expand' code
Plug 'AndrewRadev/splitjoin.vim'

" vim-expand-region - expand visually selected text by objects
Plug 'terryma/vim-expand-region'

" vim-lion - align stuff by characters 
Plug 'tommcdo/vim-lion'

" Targets.vim - great text object plugin for movements etc...
Plug 'wellle/targets.vim'

" vim-highlightedyank - highlights yanks temporarily 
Plug 'machakann/vim-highlightedyank'

" vim-cool - after searching disables search highlighting
Plug 'romainl/vim-cool'

" vim-visual-star-search - search buffer for word under cursor with *
Plug 'bronson/vim-visual-star-search'

" vim-pasta - pasting support 
Plug 'sickill/vim-pasta'

" SearchComplete - completion for search 
Plug 'vim-scripts/SearchComplete'

" vim-rooter - sets root directory to vcs root
Plug 'airblade/vim-rooter'

" vim-bbye
Plug 'moll/vim-bbye'

" polyglot - language pack for vim
Plug 'sheerun/vim-polyglot'

" emmet-vim - emmet, for vim 
Plug 'mattn/emmet-vim'

" vim-snippets - snippet pack
Plug 'honza/vim-snippets'

" vim-fugitive - git intergration 
Plug 'tpope/vim-fugitive'

" nvim-lsp
Plug 'neovim/nvim-lsp'

" nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

" completion-nvim - native nvim completion
Plug 'nvim-lua/completion-nvim'

" completion-treesitter
Plug 'nvim-treesitter/completion-treesitter'

" completion-buufers
Plug 'steelsojka/completion-buffers'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" diagnostic-nvim 
Plug 'nvim-lua/diagnostic-nvim'

" Typeracer
Plug 'norcalli/typeracer.nvim'

call plug#end()

" Install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
