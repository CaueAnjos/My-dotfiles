-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

vim.keymap.set("n", "ç", "'", { desc = "Goto mark", silent = true })

vim.keymap.set("n", "<leader>çx", function()
  local mark = vim.fn.input("Delete mark: ")
  if mark ~= "" then
    vim.cmd("delmarks " .. mark)
  end
end, { desc = "Delete a specific mark", silent = true })
