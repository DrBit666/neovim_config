local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
  s("jhandle", {
    t({ "func(h * handler) " }),
    i(1),
    t({ "(ctx *gin.Context) (interface{}, error) {", "  " }),
    i(2),
    t({ " ", "" }),
    t({ "  return nil, nil ", "" }),
    t({ "}" }),
  }),
})

ls.add_snippets("all", {
  s("dhandle", {
    t({ "func(h * handler) " }),
    i(1),
    t({ "(ctx *gin.Context) (reader io.Reader, fileName string,", "" }),
    t({ " contentType string, err error,)", "  " }),
    i(2),
    t({ " ", "" }),
    t({ "  return reader, fileName, contentType, err", "" }),
    t({ "}" }),
  }),
})
