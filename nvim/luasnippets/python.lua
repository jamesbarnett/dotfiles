local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("python", {
  s({
    name = "python Shebang",
    trig = "!py",
  }, {
    t({ "#!/usr/bin/env python", "", "" }, i(0)),
  }),
  s({
    name = "File guard",
    trig = "ifm",
  }, {
    t({ 'if __name__ == "main":', "\t" }),
    i(1),
    i(0),
  }),
})
