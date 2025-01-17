return {
  {
    "f-person/git-blame.nvim",
  },
  {
    "karb94/neoscroll.nvim",
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "voldikss/vim-translator",
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "gomodifytags", "impl" } },
      },
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      })
    end,
  },

  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       go = { "goimports", "gofumpt" },
  --     },
  --   },
  -- },

  -- {
  --   "folke/trouble.nvim",
  --   opts = {
  --     modes = {
  --       symbols = {
  --         win = { position = "right", size = 0.3 },
  --       },
  --     },
  --   },
  -- },

  --fzf
  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     -- calling `setup` is optional for customization
  --     require("fzf-lua").setup({})
  --   end,
  -- },

  -- 太卡了不要
  -- {
  --   "dstein64/nvim-scrollview",
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   dependencies = {
  --     "tpope/vim-dadbod",
  --   },
  -- },

  -- 用不了
  -- {
  --   "goolord/alpha-nvim",
  --   event = "VimEnter",
  --   opts = function()
  --     local dashboard = require("alpha.themes.dashboard")
  --     --   local logo = [[
  --     --   顺     风     顺     水     顺     财     神
  --     -- ]]
  --     local logo = [[
  --   ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
  --   ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
  --   ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
  --   ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
  --   ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
  --   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
  --   ]]
  --
  --     dashboard.section.header.val = vim.split(logo, "\n")
  --     return dashboard
  --   end,
  -- },
}
