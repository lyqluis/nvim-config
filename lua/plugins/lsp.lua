return {
	-- ts-server 替代品
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		event = "VeryLazy",
		config = function()
			local api = require("typescript-tools.api")
			require("typescript-tools").setup({
				handlers = {
					-- filter Error
					["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 6133 }), -- [tsserver 6133] [I] 'React' is declared but its value is never read
				},
				settings = {
					-- https://github.com/microsoft/TypeScript/blob/v5.0.4/src/server/protocol.ts
					tsserver_file_preferences = {
						-- importModuleSpecifierPreference = 'non-relative',
					},
				},
			})
			-- :w 的时候进行操作：自动导入缺失模块，排序import，format
			local autocmd = vim.api.nvim_create_autocmd
			autocmd("BufWritePre", {
				pattern = "*.ts,*.tsx,*.jsx,*.js",
				callback = function(args)
					vim.cmd("TSToolsAddMissingImports sync")
					vim.cmd("TSToolsOrganizeImports sync")
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
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
	{
		"nvimdev/lspsaga.nvim",
		event = "VeryLazy",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
