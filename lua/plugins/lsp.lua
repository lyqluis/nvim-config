return {
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	dependencies = {
	-- 		"nvimtools/none-ls-extras.nvim", -- require other no-builtin resources
	-- 	},
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		-- setup null-ls
	-- 		local null_ls = require("null-ls")
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				-- sources need to be installed in Mason
	-- 				-- lua,luau
	-- 				null_ls.builtins.formatting.stylua,
	-- 				-- js,ts
	-- 				require("none-ls.diagnostics.eslint_d"),
	-- 				null_ls.builtins.formatting.prettier,
	-- 				-- sh
	-- 				null_ls.builtins.formatting.shfmt,
	-- 				-- nginx
	-- 				-- null_ls.builtins.formatting.nginx_beautifier,
	-- 				-- null_ls.builtins.code_actions.shellcheck,
	-- 				-- for python
	-- 				-- null_ls.builtins.formatting.black,
	-- 				-- null_ls.builtins.formatting.isort,
	-- 				-- null_ls.builtins.diagnostics.hadolint,
	-- 				-- null_ls.builtins.formatting.nixfmt,
	-- 			},
	-- 			debug = true,
	-- 		})
	-- 	end,
	-- },

	-- ts-server 替代品
	{
		"pmizio/typescript-tools.nvim",
		event = "VeryLazy",
	},
	-- https://github.com/williamboman/mason.nvim
	{
		"williamboman/mason.nvim",
		-- event = 'VeryLazy',
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
}
