return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		config = function()
			vim.cmd.cnoreabbrev([[git Git]]) -- alias :Git to :git
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end
					local opts = { noremap = true, silent = true }

					map("n", "<leader>gp", gitsigns.preview_hunk, opts)
					map("n", "<leader>gb", gitsigns.toggle_current_line_blame, opts) -- 切换显示当前行最后一次提交信息
				end,
			})
		end,
	},
}
