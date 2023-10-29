-- cmp
local cmp = require("cmp")
cmp.event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)

-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
  s("jhandle", {
    t({ "func(h * handler) " }),
    i(1, "<func name>"),
    t({ "(ctx *gin.Context) (interface{}, error) {", "  " }),
    i(2, "<func body>"),
    t({ " ", "" }),
    t({ "  return nil, nil ", "" }),
    t({ "}" }),
  }),
})

ls.add_snippets("go", {
  s("dhandle", {
    t({ "func(h * handler) " }),
    i(1, "<func name>"),
    t({ "(ctx *gin.Context) (reader io.Reader, fileName string,", "" }),
    t({ " contentType string, err error,)", "  " }),
    i(2, "<func body>"),
    t({ " ", "" }),
    t({ "  return reader, fileName, contentType, err", "" }),
    t({ "}" }),
  }),
})
