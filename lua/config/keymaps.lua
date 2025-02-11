-- For conciseness
local n_remap = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

local i_remap = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { silent = true })
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_set_keymap(
  "n",
  "<Up>",
  "v:count == 0 ? 'g<Up>' : '<Up>'",
  { noremap = true, expr = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Down>",
  "v:count == 0 ? 'g<Down>' : '<Down>'",
  { noremap = true, expr = true, silent = true }
)

-- n_remap("<C-d>", "<C-d>zz")
-- n_remap("<C-u>", "<C-u>zz")
n_remap("n", "nzzzv")
n_remap("N", "Nzzzv")

-- keep that yank for more pasting
vim.keymap.set("x", "<leader>p", '"_dP')

-- from asbjornHaland by way of theprimeagen
-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

n_remap("Q", "<nop>")

-- map save to doom emacs bindings
n_remap("<leader>fs", ":w<CR>", "[F]ile [S]ave")
-- use this as a way to avoid running autocommands on write
n_remap("<C-x><C-s>", ":noautocmd w<CR>", "[F]ile [S]ave")

-- Emacs Home and End bindings
i_remap("<C-a>", "<ESC>I")
i_remap("<C-e>", "<ESC>A")

-- Delete whole word in insert mode using Ctrl-Backspace
-- <C-h> works for reasons I don't recall, but I've remapped that to tabout and completions.
-- i_remap("<C-h>", "<C-w>")

-- Add newline above in insert mode
-- i_remap("OO", "<ESC>O")

-- BUFFERS
-- See telescope section below for view buffers
n_remap("<leader>bn", "<cmd>bnext<CR>", "[N]ext [B]uffer")
n_remap("<leader>bp", "<cmd>bprevious<CR>", "[P]revious [B]uffer")
-- delete buffer
-- n_remap("<leader>bk", "<cmd>bd<CR>")
-- Distribute text across lines using fmt
vim.api.nvim_set_keymap("v", "<leader>cw", ":!fmt -w 88<CR>", { desc = "[C]ode [W]rap" })

-- Tabs
-- n_remap("<leader>tn", ":tabnew<CR>")
-- n_remap("<leader>th", ":tabp<CR>")
-- n_remap("<leader>to", ":tabn<CR>")

-- Windows
-- n_remap("<leader>ws", ":split<CR>:Telescope buffers<CR>")
-- n_remap("<leader>wv", ":vsplit<CR>:Telescope buffers<CR>")
n_remap("<leader>ws", ":split<CR>")
n_remap("<leader>wv", ":vsplit<CR>")
n_remap("<leader>wn", "<C-w><Left>")
n_remap("<leader>wi", "<C-w><Right>")
n_remap("<leader>wu", "<C-w><Up>")
n_remap("<leader>we", "<C-w><Down>")
n_remap("<leader>wb", "<C-w>=")
n_remap("<leader>wo", ":only<CR>")
n_remap("<leader>wc", ":close<CR>")
n_remap("<M-,>", "<C-W>5<")
n_remap("<M-.>", "<C-W>5>")
n_remap("<M-=>", "<C-W>+")
n_remap("<M-->", "<C-W>-")

-- Open Lazy UI
n_remap("<leader>cl", "<cmd>Lazy<CR>", "Lazy")

-- See `:help telescope.builtin`
vim.keymap.set(
  "n",
  "<leader>fr",
  require("telescope.builtin").oldfiles,
  { desc = "[F]ind [R]ecently opened files" }
)
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>.", require("config.tele").file_finder, { desc = "Find Files" })
vim.keymap.set("n", "<leader>,", require("telescope.builtin").buffers)
n_remap("<leader>fb", ":Telescope file_browser path=%:p:h<CR>", "[F]ile [B]rowser")
vim.keymap.set(
  "n",
  "<leader>ff",
  require("telescope.builtin").find_files,
  { desc = "[F]ind [F]iles" }
)
vim.keymap.set(
  "n",
  "<leader>fp",
  "<cmd>:lua require('config.tele').edit_nvim_conf()<CR>",
  { desc = "Neovim Config Files" }
)
vim.keymap.set(
  "n",
  "<leader>fq",
  "<cmd>:lua require('config.tele').find_qmk()<CR>",
  { desc = "QMK Keyboards" }
)
vim.keymap.set(
  "n",
  "<leader>fh",
  require("telescope.builtin").help_tags,
  { desc = "[F]ind [H]elp tags" }
)
vim.keymap.set(
  "n",
  "<leader>sw",
  require("telescope.builtin").grep_string,
  { desc = "[S]earch current [W]ord" }
)
vim.keymap.set(
  "n",
  "<leader>sp",
  require("telescope.builtin").live_grep,
  { desc = "[S]earch [P]roject by grep" }
)
vim.keymap.set(
  "n",
  "<leader>sb",
  require("telescope.builtin").current_buffer_fuzzy_find,
  { desc = "[S]earch [B]uffer" }
)
vim.keymap.set(
  "n",
  "<leader>sd",
  require("telescope.builtin").diagnostics,
  { desc = "[S]earch [D]iagnostics" }
)
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "[S]earch [K]eymaps" })
n_remap("<leader>ht", "<cmd>Telescope colorscheme<CR>") -- DOOM Emacs muscle memory
vim.keymap.set(
  "n",
  "<leader>sc",
  "<cmd>Telescope colorscheme<CR>",
  { desc = "[S]earch [C]olorschemes " }
)
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[R]esume [S]earch" })

-- Diagnostic keymaps
vim.keymap.set(
  "n",
  "[d",
  ":lua vim.diagnostic.jump({ count = -1, float = true })",
  { desc = "Go to previous diagnostic message" }
)
vim.keymap.set(
  "n",
  "]d",
  ":lua vim.diagnostic.jump({ count = 1, float = true })",
  { desc = "Go to next diagnostic message" }
)
vim.keymap.set(
  "n",
  "<leader>dh",
  vim.diagnostic.open_float,
  { desc = "Open floating diagnostic message" }
)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
