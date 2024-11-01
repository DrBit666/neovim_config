require("lint").linters_by_ft = {
  go = { "golangcilint" },
}

local i = require("neogen.types.template").item
local annotation = {
  { "func_name", " %s $1", { type = { "func" } } },
  { "func_name", " %s $1", { type = { "func" } } },
  { "param_name", " %s $1", { type = { "func" } } },
}

require("neogen").setup({
  languages = {
    go = require("config.neogen-go"),
  },
  snippet_engine = "luasnip",
  enable_placeholders = true,
  placeholders_hl = "DiagnosticHint",
  placeholders_text = {
    ["description"] = "[TODO:description]",
    ["tparam"] = "[TODO:tparam]",
    ["parameter"] = "[TODO:parameter]",
    ["return"] = "[TODO:return]",
    ["class"] = "[TODO:class]",
    ["throw"] = "[TODO:throw]",
    ["varargs"] = "[TODO:varargs]",
    ["type"] = "[TODO:type]",
    ["attribute"] = "[TODO:attribute]",
    ["args"] = "[TODO:args]",
    ["kwargs"] = "[TODO:kwargs]",
    ["identifier"] = "[TODO:identifier]",
  },
})

-- neotree
require("neo-tree").setup({
  filesystem = {
    commands = {
      copy_file_name = function(state)
        local node = state.tree:get_node()
        vim.fn.setreg("*", node.name, "c")
      end,
    },

    bind_to_cwd = false,
    follow_current_file = true,
  },
  window = {
    mappings = {
      ["<space>"] = "none",
      ["Y"] = "copy_file_name",
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
})

require("trouble").setup({
  modes = {
    symbols = {
      win = { position = "right", size = 0.3 },
      focus = true,
    },
  },
})
