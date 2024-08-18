return {
  {
    "f-person/git-blame.nvim",
  },
  -- {
  --   "fatih/vim-go",
  --   build = "GoInstallBinaries",
  -- },
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
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
  { "mistricky/codesnap.nvim", build = "make" },
  -- {
  --   "dstein64/nvim-scrollview",
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   dependencies = {
  --     "tpope/vim-dadbod",
  --   },
  -- },
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
