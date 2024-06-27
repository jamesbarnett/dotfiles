return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "wwilliamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
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
          map("<leader>rn", vim.lsp.buf.rename, '[R]e[n]ame')
          map("<leader>ca", vim.lsp.buf.code_action, '[C]ode [A]ction')
          map("K", vim.lsp.buf.hover, 'Hover Documentation')
        end
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace'
              },
            },
          },
        },

        html = {
          filetypes = { "html" },
          init_options = {
            configurationSection = { "html", "css", "javascript", },
            embeddedLanguages = {
              css = true,
              javascript = true,
            },
          },
        },

        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "less",
            "sass",
            "css",
            "pug",
          }
        }
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(server or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })

      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

      require('mason-lspconfig').setup({
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {},
          capabilities, server.capabilties or {})
          require('lspconfig')[server_name].setup(server)
        end,
      })
    end,
  },
}
