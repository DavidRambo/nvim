return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local parsers = {
      "c",
      "cpp",
      "lua",
      "markdown",
      "python",
      "rust",
      "scheme",
    }
    require("nvim-treesitter").install(parsers)

    -- The following is lifted from kickstart.nvim : )
    -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
    ---@param buf integer
    ---@param language string
    local function treesitter_try_attach(buf, language)
      if not vim.treesitter.language.add(language) then
        return
      end

      vim.treesitter.start(buf, language)

      local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil

      if has_indent_query then
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end
    end

    -- Commented out because I'm not auto-installing parsers.
    -- local available_parsers = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        local installed_parsers = require("nvim-treesitter").get_installed("parsers")

        if vim.tbl_contains(installed_parsers, language) then
          treesitter_try_attach(buf, language)
        -- elseif vim.tbl_contains(available_parsers, language) then
        -- Automatically installs parser if available in nvim-treesitter and then enables it.
        --   require("nvim-treesitter").install(language):await(function()
        --     treesitter_try_attach(buf, language)
        --   end)
        else
          treesitter_try_attach(buf, language)
        end
      end,
    })
  end,
}
