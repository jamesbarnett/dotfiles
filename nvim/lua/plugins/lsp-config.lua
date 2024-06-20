return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_language_server.setup({
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "less",
          "sass",
          "css",
          "pug",
        },
        init_options = {
          ---@type table<string, string>
          includeLanguages = {},
          --- @type string[]
          excludeLanguages = {},
          --- @type string[]
          extensionsPath = {},
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
          preferences = {},
          --- @type boolean Defaults to `true`
          showAbbreviationSuggestions = true,
          --- @type "always" | "never" Defaults to `"always"`
          showExpandedAbbreviation = "always",
          --- @type boolean Defaults to `false`
          showSuggestionsAsSnippets = false,
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
          syntaxProfiles = {},
          --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
          variables = {},
        },
      })
    end,
  },
}
--
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     lazy = false,
--     dependencies = {
--       { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
--       "williamboman/mason-lspconfig.nvim",
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
--       -- { "folke/neodev.nvim", opts = {} },
--     },
--     config = function()
--       local capabilities = require("cmp_nvim_lsp").default_capabilities()
--       local lspconfig = require("lspconfig")
--
--       lspconfig.lua_ls.setup({
--         capabilities = capabilities,
--       })
--       lspconfig.tsserver.setup({
--         capabilities = capabilities,
--       })
--       lspconfig.html.setup({
--         capabilities = capabilities,
--       })
--       -- lspconfig.cssls.setup({
--       --   capabilities = capabilities,
--       -- })
--
--       lspconfig.emmet_language_server.setup({
--         filetypes = {
--           "css",
--           "eruby",
--           "html",
--           "javascript",
--           "javascriptreact",
--           "less",
--           "sass",
--           "scss",
--           "pug",
--           "typescriptreact",
--         },
--
--         init_options = {
--           includeLanguages = {},
--           excludeLanguages = {},
--           extensionsPath = {},
--           preferences = {},
--           showAbbreviationSuggestions = true,
--           showExpandedAbbreviation = "always",
--           showSuggestionsAsSnippets = false,
--           syntaxProfiles = {},
--           variables = {},
--         },
--       })
--
--       capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--       lspconfig.solargraph.setup({
--         capabilities = capabilities,
--       })
--
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP information" })
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definitions" })
--       vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
--       -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
--     end,
--   },
-- }
-- --       vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
-- --       -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
-- --     end,
-- --   },
-- -- }
