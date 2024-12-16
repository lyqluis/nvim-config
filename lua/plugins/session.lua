return {
	{
		"coffebar/neovim-project",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 100,
		keys = {
			{ "<leader>fp", ":NeovimProjectDiscover<CR>", desc = "find project" },
			{ "<leader>hp", ":NeovimProjectHistory<CR>", desc = "select a project from recent history" },
		},
		opts = {
			projects = { -- define project roots
				"~/desktop/*",
				"~/.config/*",
			},
			picker = {
				type = "telescope", -- or "fzf-lua"
			},
			-- Load the most recent session on startup if not in the project directory
			last_session_on_startup = false,
			-- Dashboard mode prevent session autoload on startup
			dashboard_mode = true,
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
	},
}
