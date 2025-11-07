-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local normalAndVisual = { "n", "x" }
local motionModes = { "n", "x", "o" }
local actionModes = { "x", "o" }
local opts = { noremap = true, silent = true }

map(motionModes, "j", "h", vim.tbl_extend("force", opts, { desc = "j → left" }))
map(actionModes, "l", "j", vim.tbl_extend("force", opts, { desc = "l → down" }))
map({ "n" }, "l", "gj", vim.tbl_extend("force", opts, { desc = "l → down" }))
map(motionModes, ";", "l", vim.tbl_extend("force", opts, { desc = "; → right" }))
map(motionModes, "h", ";", vim.tbl_extend("force", opts, { desc = "h → ;" }))

map(motionModes, "<Up>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Window: focus up" }))
map(motionModes, "<Down>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Window: focus down" }))
map(motionModes, "<Left>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Window: focus left" }))
map(motionModes, "<Right>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Window: focus right" }))

-- remapping resume search around search and replace
map(normalAndVisual, "<leader>sr", function()
  require("snacks").picker.resume()
end, { desc = "Resume Last Search" })
map(normalAndVisual, "<leader>sR", function()
  require("grug-far").open({ transient = true })
end, { desc = "Search & Replace" })
