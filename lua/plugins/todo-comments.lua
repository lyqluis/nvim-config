return {
	{
		-- TODO: change TODO color
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		keys = {
			{ "<leader>d", "<cmd>TodoTelescope<cr>", desc = "Previous todo comment" },
		},
		config = function()
			require("todo-comments").setup()
		end,
	},
}
