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
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    event = "VeryLazy",
    config = function()
      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        handlers = {
          -- filter Error
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 6133 }, -- [tsserver 6133] [I] 'React' is declared but its value is never read
        },
        settings = {
          -- https://github.com/microsoft/TypeScript/blob/v5.0.4/src/server/protocol.ts
          tsserver_file_preferences = {
            -- importModuleSpecifierPreference = 'non-relative',
          },
        },
      }
      local autocmd = vim.api.nvim_create_autocmd
      -- :w 的时候自动导入未导入模组以及对import排序
      autocmd('BufWritePre', {
        pattern = '*.ts,*.tsx,*.jsx,*.js',
        callback = function(args)
          vim.cmd 'TSToolsAddMissingImports sync'
          vim.cmd 'TSToolsOrganizeImports sync'
          -- Todo: require('conform').format { bufnr = args.buf }
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
}
