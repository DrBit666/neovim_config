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
}
