return {
  -- {
  --   "hrsh7th/cmp-buffer",
  -- },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
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
  { "mattn/emmet-vim" },
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

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_lua").load({
        paths = "./luasnippets",
      })
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "emmet_vim" },
          --   -- { name = "path" },
          -- }, {
          --   {
          --     name = "buffer",
          --     option = {
          --       keyword_pattern = [[\k\+]],
          --     },
          --   },
        }),
      })
    end,
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-path",
  },
}
