return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", mode = "i", false }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },
}
