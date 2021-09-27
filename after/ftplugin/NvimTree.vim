hi NvimTreeNormal guibg=#1d2021
hi Cursor blend=100

augroup HideCursor
  au!
  au BufWinEnter,WinEnter,CmdLineLeave <buffer> set guicursor=a:block-Cursor/Cursor-blinkon0,
  au BufLeave,WinClosed,WinLeave,CmdLineEnter <buffer> set guicursor&
augroup END
