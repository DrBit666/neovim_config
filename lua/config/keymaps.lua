-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
function RelativePath()
  local path = vim.fn.expand("%:p:h") -- path of current file(except file)
  local file = vim.fn.expand("%:t") -- file name
  local relative_path = vim.fn.fnamemodify(path .. "/" .. file, ":~:.") -- build relative path

  vim.fn.setreg("+", relative_path) -- copy relative path to cliboard
  vim.notify('Copied relative_path"' .. relative_path .. '" to the clipboard!')
end

function AbsolutePath()
  local path = vim.fn.expand("%:")
  vim.fn.setreg("+", path)
  vim.notify('Copied absolute_path"' .. path .. '" to the clipboard!')
end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set({ "i", "v" }, "jk", "<esc>", opts)

keymap.set("n", "<F11>", [[<Cmd>set spell!<CR>]], opts)
-- clipboard
-- vim.keymap.del({ "n", "v" }, "Y")
keymap.set({ "n", "v" }, "Y", '"my', opts)

keymap.set({ "n", "v" }, "P", '"mp', opts)

keymap.set("n", "cp", RelativePath, opts)

keymap.set("n", "cpa", AbsolutePath, opts)

keymap.set("n", "<Leader>gC", require("gitblame").copy_sha_to_clipboard, opts)
