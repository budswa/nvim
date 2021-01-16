# ÜberVim

This is Über Neovim, or if you'd prefer, as I do, ÜberVim.


## Features
ÜberVim is designed with the Unix philosphy in mind; do one thing and do it
well. It is configured in VimL and Lua, no Python or Ruby. This means it is
fast. Very fast. With all of the plugins the start up time on my system is
about 75ms.

ÜberVim utilizes Neovims (>=0.5) embedded Lua API. Lots of the plugins in this
configuration utilize Lua. Plugins like Treesitter, Nvim-lsp and Telescope
are built and configured in Lua.

This configuration also uses a custom Neovim theme called Cleareye. The theme
is made in Lua, and supports Treesitters semantic highlighting. The theme is
based off of [Zephyr-nvim](https://github.com/glepnir/zephyr-nvim) and
[doom-one.vim](https://github.com/romgrk/doom-one.vim) colorschemes.

## Requirements
Although this project is supposed to be mostly out of the box, there
are a few things you might need to do to get this Neovim distrobution
working as best as possible. That being said, to use this distrobution
you do not need all the requirements. I would reccomend fulfillying all
of the dependencies.

### Dependencies
* Neovim Nightly build (>=0.5)
* Coreutils (GNU, Plan 9, Rust Coreutils, etc..)
* Git
* Curl
* Nodejs + npm
* Yarn

### Optional dependencies
* xclip
* xsel
* Ripgrep
* fd
* Universal-ctags
* Lazygit
