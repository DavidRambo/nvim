-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
  -- Editor related plugins
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "dirvish",
          "figitive",
          "md",
          "org",
          "norg",
        },
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ignore = "^$",
      toggler = {
        line = "<leader>cc",
        block = "<leader>cb",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        -- Add comment on the line above
        above = "<leader>cO",
        -- Add comment on the line below
        below = "<leader>co",
        -- Add comment at the end of line
        eol = "<leader>ca",
      },
      -- Enable keybindings
      -- Note: If given `false` then the plugin won't create any mappings
      mappings = {
        -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        -- Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
    },
  },

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Git related plugins
  -- {
  --   "TimUntersberger/neogit",
  --   dependencies = "nvim-lua/plenary.nvim",
  -- },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require("kickstart.plugins.autoformat"),
  -- require 'kickstart.plugins.debug',
  { import = "plugins" },
}, {})

vim.cmd.colorscheme("catppuccin-macchiato")

-- [[ Setting options ]]
require("config.options")

-- [[ Keymaps ]]
require("config.keymaps")

-- vim.diagnostic.config({
--   -- virtual_text = {
--   --   source = "always", -- Or "if_many"
--   -- },
--   float = {
--     source = "always", -- Or "if_many"
--   },
-- })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>dh", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = "LSP: " .. desc
--     end

--     vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
--   end

--   nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
--   nmap("<C-c>", vim.lsp.buf.code_action, "[C]ode [A]ction")

--   nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
--   nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
--   nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
--   nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
--   nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
--   -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

--   -- See `:help K` for why this keymap
--   nmap("K", vim.lsp.buf.hover, "Hover Documentation")
--   nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

--   -- Lesser used LSP functionality
--   nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
--   -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   -- nmap('<leader>wl', function()
--   --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   -- end, '[W]orkspace [L]ist Folders')

--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
--     vim.lsp.buf.format()
--   end, { desc = "Format current buffer with LSP" })
-- end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
-- local servers = {
--   clangd = {},
--   -- gopls = {},
--   -- pyright = {},
--   -- rust_analyzer = {},
--   -- tsserver = {},
--   pylsp = {
--     pylsp = {
--       plugins = {
--         black = { enabled = true },
--         -- disable linting in favor of ruff_lsp
--         mccabe = { enabled = false },
--         pycodestyle = {
--           enabled = false,
--           -- ignore = { "W391", "E226", "E501" },
--           -- maxLineLength = 88,
--         },
--         -- TODO: Add black
--         pyflakes = { enabled = false },
--         pylint = { enabled = false },
--       },
--     },
--   },
--   ruff_lsp = {},
--   lua_ls = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
--   },
-- }

-- Setup neovim lua configuration
-- require("neodev").setup()

-- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- -- Ensure the servers above are installed
-- local mason_lspconfig = require("mason-lspconfig")

-- mason_lspconfig.setup({
--   ensure_installed = vim.tbl_keys(servers),
-- })

-- mason_lspconfig.setup_handlers({
--   function(server_name)
--     require("lspconfig")[server_name].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     })
--   end,
-- })

-- -- nvim-cmp setup
-- local cmp = require("cmp")
-- local luasnip = require("luasnip")

-- luasnip.config.setup({})

-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete({}),
--     ["<CR>"] = cmp.mapping.confirm({
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     }),
--     -- ["<Tab>"] = cmp.mapping(function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_next_item()
--     --   elseif luasnip.expand_or_jumpable() then
--     --     luasnip.expand_or_jump()
--     --   else
--     --     fallback()
--     --   end
--     -- end, { "i", "s" }),
--     -- ["<S-Tab>"] = cmp.mapping(function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_prev_item()
--     --   elseif luasnip.jumpable(-1) then
--     --     luasnip.jump(-1)
--     --   else
--     --     fallback()
--     --   end
--     -- end, { "i", "s" }),
--   }),
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--   },
-- })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
