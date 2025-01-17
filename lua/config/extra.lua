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
