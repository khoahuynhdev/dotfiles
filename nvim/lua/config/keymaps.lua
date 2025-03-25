-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- daily note
vim.keymap.set("n", "<leader>td", function()
  -- Get current date in YYYY-MM-DD format
  local date = os.date("%Y-%m-%d")
  local dir_path = "/Users/khoah/anzx/trackers"
  local file_path = dir_path .. "/" .. date .. ".md"
  
  -- Create directory if it doesn't exist
  local dir_exists = vim.fn.isdirectory(dir_path)
  if dir_exists == 0 then
    vim.fn.mkdir(dir_path, "p")
  end
  
  -- Open the file (creates if it doesn't exist)
  vim.cmd("edit " .. file_path)
end, { desc = "Create and open daily tracker file" })