if not pcall(require, "luasnip") then
  return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local i = ls.insert_node
local f = ls.function_node

-- local events = require("luasnip.util.events")

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<--", "Error" } },
      },
    },
  }
}

-- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/tj/snips/ft/*.lua", true)) do
--   loadfile(ft_path)()
-- end
ls.snippets = {
  all = {
    --
    ls.parser.parse_snippet("exp", "-- this is what was expanded!"),
    s("curtime",
    f(function()
      return os.date "%D - %H:%M"
    end)
    ),
  },

  cpp = {

  },
  lua = { -- TODO: A bunch of other languages (CL and LFE preludes)
    --
    s(
      "req",
      fmt([[local {} = require "{}"]], {
        f(function(import_name)
          local parts = vim.split(import_name[1][1], ".", true)
          return parts[#parts] or ""
        end, { 1 }),
        i(i),
      })
    ),
  },
}

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  print("C-k handler called")
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    print("We aren't jumpable.")
  end
end, { silent = false })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

vim.keymap.set("n", "<leader>gl", function()
  vim.cmd("so ~/code/dotfiles/nvim/after/plugin/luasnip.lua")
end, { desc = "Snippet reloading." })

