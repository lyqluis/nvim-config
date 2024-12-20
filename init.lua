local set = vim.o
set.number = true -- line number
set.relativenumber = true -- relative line number
set.clipboard = "unnamed" -- 系统剪切板

-- tab
set.tabstop = 2 -- tab 占用 2 个空格
set.softtabstop = 2 -- insert mode 下 tab 占 2 个空格
set.shiftwidth = 2 -- 缩进使用 2 个空格
set.expandtab = true -- 插入 tab 时转换为相应数量的空格

-- intelligent search
set.ignorecase = true -- 搜索时忽略大小写
set.smartcase = true -- 智能大小写匹配

-- code folding
-- set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- set.foldcolumn = "1"
set.foldlevel = 99 -- otherwise nvim-ufo will autofolding everything when esc or open file

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
