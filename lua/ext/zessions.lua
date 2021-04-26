require("zessions").config:update({
  cwd = vim.fn.stdpath("config").."./.sessions",
  force_overwrite = false,
  force_delete = false,
  bdelete = true,
  verbose = true,
})
