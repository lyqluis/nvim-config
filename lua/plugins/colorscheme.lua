return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			require("onedarkpro").setup({
				highlights = {
					Folded = {
						-- bg = "#5c6370",
						bg = "#394863",
					},
				},
			})
		end,
	},
	--   {
	--     'nvim-lualine/lualine.nvim',
	--     config = function()
	--         require('lualine').setup {
	--         }
	--     end
	-- },
}
