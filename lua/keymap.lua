local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 将 d 操作映射为不保存内容到任何寄存器（配合将全局剪切板关联为系统剪切板）
map("n", "d", '"_d', { noremap = true, silent = true })
map("n", "dd", '"_dd', { noremap = true, silent = true })
map("v", "d", '"_d', { noremap = true, silent = true })
map("v", "dd", '"_dd', { noremap = true, silent = true })

-- switch between windows
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader><Tab>", "<C-w>w", opts)

-- conform: formatter
map("n", "Ï", "<cmd>Format<CR>", opts) -- format: shift + alt + f

-- move.nvim: move line with alt + j/k/l/h
-- Normal-mode commands
map("n", "∆", ":MoveLine(1)<CR>", opts) -- alt + j
map("n", "˚", ":MoveLine(-1)<CR>", opts) -- alt + k
map("n", "˙", ":MoveHChar(-1)<CR>", opts) -- alt + h
map("n", "¬", ":MoveHChar(1)<CR>", opts) -- alt + l
map("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
map("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
map("v", "∆", ":MoveBlock(1)<CR>", opts) -- alt + j
map("v", "˚", ":MoveBlock(-1)<CR>", opts) -- alt + k
map("v", "˙", ":MoveHBlock(-1)<CR>", opts) -- alt + h
map("v", "¬", ":MoveHBlock(1)<CR>", opts) -- alt + l

-- barbar.nvim:
map("n", "“", ":BufferPrevious<CR>", opts) -- alt + [
map("n", "‘", ":BufferNext<CR>", opts) -- alt + ]
-- Pin/unpin buffer
map("n", "π", "<Cmd>BufferPin<CR>", opts) -- alt + p
-- close current buffer
map("n", "∑", "<Cmd>BufferClose<CR>", opts) -- alt + w
