-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.extra")
require("config.dap")

vim.cmd.colorscheme("melange")
vim.opt.termguicolors = true
