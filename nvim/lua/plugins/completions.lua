return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
  },
  { "mattn/emmet-vim", },
  {
    "dcampos/cmp-emmet-vim",
    sources = {
      {
        name = "emmet_vim",
        option = {
          filetypes = { "html", "css", "erb" },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      local ls = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_lua").load({
        paths = "./luasnippets",
      })
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      cmp.setup({
        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          ["<C-l>"] = cmp.mapping(function()
            if ls.expand_or_locally_jumpable() then
              ls.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if ls.locally_jumpable(-1) then
              ls.jump(-1)
            end
          end, { 'i', 's' }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lua", },
          { name = "nvim_lsp", },
          { name = "luasnip", },
          { name = "emmet_vim", },
          { name = "path", },
          { name = "buffer", keyword_length = 5, },
        }),

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            menu = {
              buffer = "[buf]",
              emmet_vim = "[emmet]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
            }
          })
        },

        experimental = {
          native_menu = false,
          ghost_text = true,
        }
      })
    end,
  },
  { "hrsh7th/cmp-buffer", },
  { "hrsh7th/cmp-path", },
  { "hrsh7th/cmp-nvim-lua", },
  { "hrsh7th/cmp-nvim-lsp", },
  { "hrsh7th/cmp-cmdline", },
  { "saadparwaiz1/cmp_luasnip", },
  { "onsails/lspkind.nvim", },
}
