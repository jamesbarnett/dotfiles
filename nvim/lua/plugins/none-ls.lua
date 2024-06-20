return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.htmlbeautifier.with({
        --   filetypes = { "html", "eruby" },
        -- }),
        -- null_ls.builtins.formatting.prettier.with({
        --   filetypes = { "json", "yaml", "markdown", "css" },
        -- }),
        -- null_ls.builtins.diagnostics.solargraph,
        -- null_ls.builtins.diagnostics.stylelint_lsp,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer." })
  end,
}
