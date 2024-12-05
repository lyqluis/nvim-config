return {
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
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
						-- bg = "#5c6370",  -- default onedark grey
						bg = "#394863",
					},
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "onedark",
		},
	},
	-- dashboard
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", "<cmd>ene <CR>"),
				dashboard.button("leader t", "  Open directory list"),
				dashboard.button("leader p", "󰈞  Find file"),
				dashboard.button("leader o f", "󱋡  Recently opened files"),
				-- dashboard.button("SPC f r", "  Frecency/MRU"),
				dashboard.button("leader Shift p", "󰈮  Find word"),
				-- dashboard.button("SPC f m", "  Jump to bookmarks"),
				-- dashboard.button("SPC s l", "  Open last session"),
				dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
			}

			alpha.setup(dashboard.opts)
		end,
	},
	-- no highlight search
	{
		"nvimdev/hlsearch.nvim",
		event = "BufRead",
		config = function()
			require("hlsearch").setup()
		end,
	},
}
