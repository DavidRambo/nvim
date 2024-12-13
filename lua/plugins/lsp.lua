return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- Note: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {},
      },

      -- Additional lua configuration. Setup before setting up lspconfig for lua_ls.
      { "folke/neodev.nvim", opts = {} },
    },
    opts = {
      diagnostics = {
        float = {
          source = "always",
        },
        virtual_text = false,
      },
      -- autoformat = true,
      servers = {
        -- clangd = {},
        gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- pylsp = {
        -- 	pylsp = {
        -- 		plugins = {
        -- 			black = { enabled = true },
        -- 			-- disable linting in favor of ruff_lsp
        -- 			mccabe = { enabled = false },
        -- 			pycodestyle = {
        -- 				enabled = false,
        -- 				-- ignore = { "W391", "E226", "E501" },
        -- 				-- maxLineLength = 88,
        -- 			},
        -- 			pyflakes = { enabled = false },
        -- 			pylint = { enabled = false },
        -- 		},
        -- 	},
        -- },
        -- jedi_language_server = {}, -- Moved outside of loop to disable diagnostics.
        rnix = {},
        ruff = {},
        lua_ls = {
          settings = {
            Lua = {
              format = { enable = false },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        html = {},
        cssls = {},
        -- tailwindcss = {},
        -- eslint = {},
        ts_ls = {},
      },
    },
    config = function(_, opts)
      local on_attach = function(client, bufnr)
        -- Do not attach the server to Navbuddy if it does not support documentSymbols.
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navbuddy").attach(client, bufnr)
        end

        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end

          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<C-c>", vim.lsp.buf.code_action, "[C]ode [A]ction")

        nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("<leader>gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap(
          "<leader>ds",
          require("telescope.builtin").lsp_document_symbols,
          "[D]ocument [S]ymbols"
        )
        -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        vim.keymap.set(
          { "n", "i" },
          "<C-k>",
          vim.lsp.buf.signature_help,
          { buffer = bufnr, desc = "Signature Help" }
        )
        -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Lesser used LSP functionality
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        -- nmap('<leader>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, '[W]orkspace [L]ist Folders')

        -- Create a command `:Format` local to the LSP buffer
        -- vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        --   vim.lsp.buf.format()
        -- end, { desc = "Format current buffer with LSP" })
        -- nmap("<leader>bf", "<cmd>Format<CR>", "[B]uffer [F]ormat")
      end

      -- Add a border to the hover frame.
      -- FIX: Tried to replace deprecated API, but this doesn't work.
      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({ border = "rounded" })
      -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.hover({ border = "rounded" })

      -- require("lsp_signature").on_attach({
      --   bind = true, -- This is mandatory, otherwise border config won't get registered.
      --   handler_opts = {
      --     border = "rounded",
      --   },
      --   hint_enable = false,
      --   hint_prefix = "",
      -- })
      -- , bufnr) -- bufnr only required when using toggle_key function

      require("neodev").setup()

      vim.diagnostic.config(opts.diagnostics)

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require("mason-lspconfig")

      -- mason_lspconfig.setup({
      --   ensure_installed = vim.tbl_keys(opts.servers),
      -- })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = opts.servers[server_name],
          })
        end,
      })

      -- Moved out of mason_lspconfig handlers loop because diagnostics
      -- were not being disabled.
      require("lspconfig").jedi_language_server.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          diagnostics = { enable = false },
        },
      })

      -- Workaround for warning when using clang-format with clangd lsp.
      capabilities.offsetEncoding = { "utf-16" }

      require("lspconfig").clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          diagnostics = { enable = false },
        },
      })
    end,
  },

  {
    -- From LazyVim's lua/lazyvim/plugins/lsp/init.lua
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "beautysh",
        -- "black",
        "clangd",
        "emmet-language-server",
        -- "eslint-lsp",
        "gopls",
        "jedi-language-server",
        "lua-language-server",
        -- "mypy",
        "prettierd",
        "rnix-lsp",
        "ruff", -- for formatting with Conform.nvim
        "sql-formatter",
        "stylua",
        "typescript-language-server",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)

      local mr = require("mason-registry")

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
