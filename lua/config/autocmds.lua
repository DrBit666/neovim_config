-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_user_command("Diff", function()
--   local path = vim.fn.expand("%:p:h") -- path of current file(except file)
--   local file = vim.fn.expand("%:t") -- file name
--   local relative_path = vim.fn.fnamemodify(path .. "/" .. file, ":~:.") -- build relative path
--   local current_line_commitId = require("gitblame").current_line_commitId --get current_line_sha
--   return "git diff " .. current_line_commitId .. "^.." .. current_line_commitId .. " -- " .. relative_path
-- end, {})
