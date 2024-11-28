return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8", -- or, branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope", -- lazy load on cmd
	keys = {
		{ "<D-p>", ":Telescope find_files<cr>", desc = "find files (@Telescope)" },
		{ "<D-P>", ":Telescope live_grep<cr>", desc = "find files by regexp (@Telescope)" }, -- need to install ripgrep
		{ "<leader>of", ":Telescope oldfiles<cr>", desc = "find recent files (@Telescope)" },
		{ "<leader>rs", ":Telescope resume<cr>", desc = "restore last search list (@Telescope)" },
	},
}
