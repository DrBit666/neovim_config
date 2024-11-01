-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.extra")
require("config.dap")
require("config.lsp")

vim.cmd.colorscheme("melange")
vim.opt.termguicolors = true
