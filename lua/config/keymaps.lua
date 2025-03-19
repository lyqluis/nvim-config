-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- move.nvim: move line with alt + j/k/l/h
-- Normal-mode commands
map("n", "∆", ":MoveLine(1)<CR>", opts) -- alt + j
map("n", "˚", ":MoveLine(-1)<CR>", opts) -- alt + k
map("n", "˙", ":MoveHChar(-1)<CR>", opts) -- alt + h
map("n", "¬", ":MoveHChar(1)<CR>", opts) -- alt + l
-- map("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
-- map("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)
-- Visual-mode commands
map("v", "∆", ":MoveBlock(1)<CR>", opts) -- alt + j
map("v", "˚", ":MoveBlock(-1)<CR>", opts) -- alt + k
map("v", "˙", ":MoveHBlock(-1)<CR>", opts) -- alt + h
map("v", "¬", ":MoveHBlock(1)<CR>", opts) -- alt + l
