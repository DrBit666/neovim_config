-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "v" }, "jk", "<esc>", { silent = true, noremap = true })

vim.keymap.set("n", "<F11>", [[<Cmd>set spell!<CR>]], { noremap = true, silent = true })
