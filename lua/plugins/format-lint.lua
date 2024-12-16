return {
	-- format
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		cmd = { "ConformInfo", "Format" },
		config = function()
			require("conform").setup({
				-- Define formatters
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
				},
				-- set default options
				default_format_opts = {
					lsp_format = "fallback",
				},
				-- set up format-on-save
				format_on_save = {
					-- pattern = ".lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs",
					timeout_ms = 5000,
					lsp_fallback = true,
				},
				-- Customize formatters
				-- formatters = {
				-- 	shfmt = {
				-- 		prepend_args = { "-i", "2" },
				-- 	},
				-- },
			})
			-- If you want the formatexpr, here is the place to set it
			-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

			-- custom command Format to use conform.nvim to format
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })
		end,
	},
	-- lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}
			vim.api.nvim_create_autocmd({ "BufReadPre", "BufWritePost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
