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

--del

-- exit insert mode
keymap.set({ "i", "v" }, "jk", "<esc>", opts)

-- better use clipboard
keymap.set({ "n", "v" }, "Y", '"my', opts)
keymap.set({ "n", "v" }, "P", '"mp', opts)

-- copy oath
keymap.set("n", "cp", RelativePath, opts)
keymap.set("n", "cpa", AbsolutePath, opts)

-- copy sha to cliboard
keymap.set("n", "<Leader>gC", require("gitblame").copy_sha_to_clipboard, opts)

-- neoscroll
local t = {}
t["<C-b>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
t["<C-f>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
require("neoscroll.config").set_mappings(t)

-- window
keymap.set("n", "<F5>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<F6>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<F7>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<F8>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
