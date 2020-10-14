"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Source init.vim apon BufWritePost
autocmd! BufWritePost $MYVIMRC source %

" Vim-plug and plugins

source $HOME/.config/nvim/config/plugins.vim

" Basic configurations

source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/keys.vim 

" Plugin configurations

source $HOME/.config/nvim/config/lightline.vim
source $HOME/.config/nvim/config/startify.vim
source $HOME/.config/nvim/config/rainbow.vim
source $HOME/.config/nvim/config/quickscope.vim
source $HOME/.config/nvim/config/floaterm.vim
source $HOME/.config/nvim/config/undotree.vim
source $HOME/.config/nvim/config/lastplace.vim
source $HOME/.config/nvim/config/vimwiki.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/nvim-tree.vim
source $HOME/.config/nvim/config/nvim-colorizer.vim

