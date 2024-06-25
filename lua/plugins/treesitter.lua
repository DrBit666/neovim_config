-- if true then
--   return {}
-- end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
    opts = function(_, opts)
      opts.rainbow = {
        enable = false,
        query = "rainbow-parens",
        strategy = require("ts-rainbow").strategy.global,
      }
    end,
  },

  {
    {
      "danymat/neogen",
      config = true,
      -- Uncomment next line if you want to follow only stable versions
      -- version = "*"
    },
  },
}
