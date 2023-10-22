local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
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

ls.add_snippets("all", {
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

ls.add_snippets("all", {
  s("swag", {
    t("// @Description "),
    i(1),
    t({ " ", "" }),
    t("// @Tags "),
    i(2),
    t({ " ", "" }),
    t({ "// @Accept json", "" }),
    t({ "// @Produce json", "" }),
    t('// @Param id path int true "合同模板ID"'),
    t({ " ", "" }),
    t("// @Param body body "),
    i(3),
    t(' true "更新合同模板状态参数"', ""),
    t("// @Success 200 {object} http.Response{data="),
    i(4),
    t('} "请求成功"', ""),
    t('// @Failure 400 {object} http.Response{} "参数有误"', ""),
    t('// @Failure 500 {object} http.Response{} "服务器内部错误"', ""),
    t("// @Router"),
    i(5),
    t("   "),
  }),
})
