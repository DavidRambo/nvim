local set = vim.opt

-- set.guicursor = "" -- thick cursor in insert mode

set.background = "dark"
set.termguicolors = true

set.nu = true
set.relativenumber = true

set.signcolumn = "yes"
set.scrolloff = 4
set.sidescrolloff = 8

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
-- set.colorcolumn = "90"

set.expandtab = true

-- search settings
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hidden = true

-- set.autoindent = true
set.smartindent = true

set.backspace = "indent,eol,start"

set.iskeyword:append("-")

set.wrap = false

set.cmdheight = 1

set.showcmd = false

set.completeopt = { "menu", "menuone", "noselect" }

set.clipboard:append("unnamedplus")

-- split windows
set.splitright = true
set.splitbelow = true

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- vim.g.python3_host_prog = "/Users/david/.pyenv/versions/3.11.1/bin/python"
vim.g.python3_host_prog = "/home/david/.pyenv/shims/python3"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
