require("neoscroll").setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = { "<C-b>", "<C-f>" },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = nil, -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

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
    -- go = {
    --   template = {
    --     annotation_convention = "my_annotation",
    --     my_annotation = annotation,
    --   },
    -- },
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

local null_ls = require("null-ls")

local no_really = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "markdown", "text" },
  generator = {
    fn = function(params)
      local diagnostics = {}
      -- sources have access to a params object
      -- containing info about the current file and editor state
      for i, line in ipairs(params.content) do
        local col, end_col = line:find("really")
        if col and end_col then
          -- null-ls fills in undefined positions
          -- and converts source diagnostics into the required format
          table.insert(diagnostics, {
            row = i,
            col = col,
            end_col = end_col + 1,
            source = "no-really",
            message = "Don't use 'really!'",
            severity = vim.diagnostic.severity.WARN,
          })
        end
      end
      return diagnostics
    end,
  },
}

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

null_ls.register(no_really)
