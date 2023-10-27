-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.cmp")
require("config.extra")

vim.cmd.colorscheme("melange")
vim.opt.termguicolors = true
