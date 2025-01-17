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

local function generate_func_annotation()
  require("neogen").generate({})
end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--del

-- exit insert mode
keymap.set({ "i", "v" }, "jk", "<esc>", opts)
-- better use clipboardkeyma
-- keymap.set({ "n", "v" }, "Y", '"my', opts)
-- keymap.set({ "n", "v" }, "P", '"mp', opts)
keymap.set({ "n", "v" }, "<C-d>", '"md', opts)

-- copy path
keymap.set("n", "cp", RelativePath, opts)
keymap.set("n", "cpa", AbsolutePath, opts)

-- copy sha to cliboard
-- keymap.set("n", "<Leader>gC", require("gitblame").copy_sha_to_clipboard, opts)

-- neoscroll
local scroll = require("neoscroll").scroll
keymap.set({ "n", "v" }, "<C-b>", function()
  scroll(-25, { move_cursor = true, duration = 300, easing = "sine" })
end, opts)
keymap.set({ "n", "v" }, "<C-f>", function()
  scroll(25, { move_cursor = true, duration = 300, easing = "sine" })
end, opts)

-- window
keymap.set("n", "<C-F11>", "<cmd>vertical resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-F12>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window height" })
-- keymap.set("n", "<F11>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- keymap.set("n", "<F12>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

keymap.set("n", "<F9>", generate_func_annotation)

-- git
keymap.set("n", "<leader>gn", "<cmd>lua package.loaded.gitsigns.next_hunk()<CR>", { desc = "Next Hunk" })
keymap.set("n", "<leader>gp", "<cmd>lua package.loaded.gitsigns.prev_hunk()<CR>", { desc = "Prev Hunk" })

-- dap
vim.keymap.set("n", "<F8>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F7>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<leader><F7>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<leader><F8>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
vim.keymap.set("n", "<Leader>dq", function()
  require("dap").clear_breakpoints()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)

-- translate
vim.keymap.set("n", "<Leader>tsl", ":TranslateW<CR>")
vim.keymap.set("v", "<Leader>tst", ":'<,'>TranslateW<CR>")
