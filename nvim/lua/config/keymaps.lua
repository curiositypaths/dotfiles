-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Temporary fix to move Lines
vim.keymap.set("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
