-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open parent directory in current window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Open parent directory in floating window
vim.keymap.set("n", "<space>-", require("oil").toggle_float)

-- Configure LazyGit over GitUI
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gg")
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>gG", "<cmd>LazyGitFilterCurrentFile<cr>", { desc = "Open LazyGit Filter" })
