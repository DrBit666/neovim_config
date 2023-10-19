-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.snip")
require("config.extra")

vim.cmd.colorscheme("melange")
vim.opt.termguicolors = true
