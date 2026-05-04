if vim.loop.os_uname().sysname == "Linux" then
  vim.opt.background = "dark"
elseif vim.loop.os_uname().sysname == "Darwin" then
  vim.opt.background = "light"
end

vim.o.showmode = false

vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.colorcolumn = "90"

vim.opt.expandtab = true

-- list mode shows characters for tabs and trailing whitespace.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

-- search settings
-- Clear search highlights.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Alternatively, turn search highlights off with:
-- vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true

-- vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.breakindent = true

vim.opt.backspace = "indent,eol,start"

vim.opt.iskeyword:append("-")

vim.opt.wrap = false

vim.opt.cmdheight = 1

vim.opt.showcmd = false

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.clipboard:append("unnamedplus")

-- Persist undo/redo history after closing a file.
vim.o.undofile = true

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

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
