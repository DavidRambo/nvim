local set = vim.opt_local

-- "o" = Don't automaticaly create a new comment when using o/O
-- "r" = Don't automaticaly create a new comment when pressing enter
set.formatoptions:remove("or")
