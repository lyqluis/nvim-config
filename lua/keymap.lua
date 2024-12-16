local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- switch between windows
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader><Tab>", "<C-w>w", opts)

-- move.nvim
-- Normal-mode commands
map("n", "∆", ":MoveLine(1)<CR>", opts)
map("n", "˚", ":MoveLine(-1)<CR>", opts)
map("n", "˙", ":MoveHChar(-1)<CR>", opts)
map("n", "¬", ":MoveHChar(1)<CR>", opts)
map("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
map("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
map("v", "∆", ":MoveBlock(1)<CR>", opts)
map("v", "˚", ":MoveBlock(-1)<CR>", opts)
map("v", "˙", ":MoveHBlock(-1)<CR>", opts)
map("v", "¬", ":MoveHBlock(1)<CR>", opts)
