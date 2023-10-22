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

function Test()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(0, "textDocument/signatureHelp", params)
  if result and result[0] then
    local signatures = result[1].result.signatures
    if signatures and #signatures > 0 then
      local parameters = signatures[1].parameters
      if parameters and #parameters > 0 then
        local parameterTypes = {}
        for _, parameter in ipairs(parameters) do
          if type(parameter.label) == "string" then
            table.insert(parameterTypes, parameter.label)
          end
        end

        local parameterTypesString = table.concat(parameterTypes, ", ")
        vim.fn.setreg("+", parameterTypesString)
        print("Parameter types copied to clipboard.")
      else
        print("No parameters found.")
      end
    else
      print("No signatures found.")
    end
  else
    print("Signature help request failed.")
  end
end

--lsp
keymap.set("n", "<Leader>88", Test)

keymap.set("n", "<Leader>99", vim.lsp.buf.hover)
