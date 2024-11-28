local set = vim.o
set.number = true -- line number
set.relativenumber = true -- relative line number
set.clipboard = "unnamed" -- 系统剪切板

-- tab
set.tabstop = 2 -- tab 占用 2 个空格
set.shiftwidth = 2 -- 缩进使用 2 个空格
set.expandtab = true -- 插入 tab 时转换为相应数量的空格

-- copy 时高亮
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 500,
		})
	end,
})

-- colorscheme related config
vim.opt.termguicolors = true

-- keymap
require("keymap")
-- lazy.nvim
require("config.lazy")

-- colorscheme
vim.cmd.colorscheme("onedark")

-- lsp config
require("lsp")
