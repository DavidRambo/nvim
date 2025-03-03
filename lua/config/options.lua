local set = vim.opt

-- set.guicursor = "" -- thick cursor in insert mode

if vim.loop.os_uname().sysname == "Linux" then
  set.background = "dark"
elseif vim.loop.os_uname().sysname == "Darwin" then
  set.background = "light"
end

set.termguicolors = true

set.nu = true
set.relativenumber = true

set.signcolumn = "yes"
set.scrolloff = 3
set.sidescrolloff = 8

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
-- set.colorcolumn = "90"

set.expandtab = true

set.virtualedit = "block"

set.inccommand = "split"

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

set.completeopt = "menu,menuone,noselect"

set.clipboard:append("unnamedplus")

-- split windows
set.splitright = true
set.splitbelow = true

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.filetype.add({
  extension = {
    ["http"] = "http",
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})
