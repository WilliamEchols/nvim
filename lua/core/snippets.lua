-- snippets

return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Enable autotrigger for snippets
      ls.config.set_config({
        enable_autosnippets = true,
      })

      -- Define snippets
      ls.add_snippets("all", {
        -- pmatrix snippet
        s({ trig = "pmatrix", snippetType = "autosnippet" }, {
          t("\\begin{pmatrix}"),
          t({"", ""}),
          i(1),
          t({"", "\\end{pmatrix}"}),
          i(0),
        }),

        -- align snippet
        s({ trig = "align", snippetType = "autosnippet" }, {
          t("\\begin{align*}"),
          t({"", ""}),
          i(1),
          t({"", "\\end{align*}"}),
          i(0),
        }),

        -- dz snippet
        s({ trig = "dz", snippetType = "autosnippet" }, {
          t("\\ \\mathrm{d}z"),
        }),
      })
    end,
  },
}
