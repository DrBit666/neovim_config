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
  -- {
  --   "dstein64/nvim-scrollview",
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   dependencies = {
  --     "tpope/vim-dadbod",
  --   },
  -- },
}
