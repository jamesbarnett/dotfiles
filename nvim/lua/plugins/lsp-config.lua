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
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my-neovim-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map("gd", require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map("gr", require('telescope.builtin').lsp_definitions, '[G]oto [R]eferences')
          map("gI", require('telescope.builtin').lsp_definitions, '[G]oto [I]mplementation')
          map("<leader>D", require('telescope.builtin').lsp_type_definitions, 'Type [D]efintion')
          map("<leader>ds", require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map("<leader>dw", require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map("<leader>rn", vim.lsp_buf.rename, '[R]e[n]ame')
          map("<leader>ca", vim.lsp.buf.code_action, '[C]ode [A]ction')
          map("K", vim.lsp.buf.hover, 'Hover Documentation')
        end
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend(
        'force', capabilities, require("cmp_nvim_lsp").default_capabilities())

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
