return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		keys = {
			{
				"<leader>t",
				":Neotree toggle reveal<CR>",
				desc = "toggle Neotree automatically find and focus the current file (@Neotree)",
			},
		},
		config = function()
			require("neo-tree").setup({
				-- default config: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
				popup_border_style = "rounded", -- popup input border style: "NC"|"double"|"none"|"rounded"|"shadow"|"single"|"solid"

				-- source_selector provides clickable tabs to switch between sources(filesystem,git_status,buffers...).
				source_selector = {
					statusline = true,
				},
				window = {
					width = 20,
				},
			})
		end,
	},
}
