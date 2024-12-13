local safeRequire = require("lib").safeRequire
local lspconfig = safeRequire("lspconfig")

vim.lsp.set_log_level("ERROR")

-- local lspconfig = require('lspconfig')
require("mason").setup()
require("mason-lspconfig").setup()

-- fallback if lsp exit suddenly
vim.api.nvim_create_autocmd("LspDetach", {
	callback = function(args)
		-- print("detaching LSP..") local bufname = vim.fn.bufname(args.buf) if
		-- bufname:match("%.go$") then print("bufname " .. bufname) print("restarting
		-- LSP..")
		vim.cmd("LspStart")
		-- end
	end,
})

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	vim.cmd("syntax on")
	-- if client.name == "gopls" and not
	-- client.server_capabilities.semanticTokensProvider then local semantic =
	-- client.config.capabilities.textDocument.semanticTokens
	-- client.server_capabilities.semanticTokensProvider = { full = true,
	-- legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes =
	-- semantic.tokenTypes }, range = true,
	-- 	} end
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- add to your shared on_attach callback

	-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- cousor hold for 3 seconds, show signature helper silent
	-- vim.api.nvim_command([[autocmd CursorHold  <buffer> lua
	-- vim.lsp.buf.hover() ]])

	-- -- Mappings.
	-- defult mapping:
	-- <C-]>, go to definition
	-- Enables (manual) omni mode completion with <C-X><C-O> in Insert mode. For autocompletion, an autocompletion plugin is required.
	-- Enables LSP formatting with gq.
	-- [d, vim.diagnostic.goto_prev()
	-- ]d, vim.diagnostic.goto_next()
	-- <C-W>d, vim.diagnostic.open_float()
	-- gd, vim.lsp.buf.definition
	-- gD, vim.lsp.buf.declaration
	-- K, vim.lsp.buf.hover
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "Ï", "<cmd>Format<CR>", opts) -- format: shift + alt + f

	-- buf_set_keymap("n", "<Enter>", "<Nop>", opts)
	-- buf_set_keymap("n", "gD", "<cmd>Lspsaga goto_type_definition<CR>", opts)
	-- buf_set_keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	-- -- buf_set_keymap("n", "gv", "<cmd>Lspsaga peek_definition<CR>", opts)
	-- buf_set_keymap("n", "<Leader>ga", "<cmd>Lspsaga code_action<CR>", opts)
	-- -- -- coode action for extract function or variable
	-- -- buf_set_keymap("v", "ga", "cmd>lua vim.lsp.bug.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) -- 对光标位置代码进行操作
	buf_set_keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts) -- 对代码块进行操作
	-- buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	-- buf_set_keymap("n", "<space>dt", "<cmd>lua require('dap-go').debug_test()<CR>", opts)
	-- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	-- buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
	-- -- buf_set_keymap("n", "<space>gr", "<cmd>Lspsaga finder<CR>", opts)
	-- vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, opts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- buf_set_keymap("n", "<S-A>f", ":lua vim.lsp.buf.format()<CR>", opts)
	-- -- if current buff end with _test.go, then set keymap for error
	-- local buf_name = vim.api.nvim_buf_get_name(bufnr)
	-- buf_set_keymap("n", "<space>ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	--
	-- -- Set autocommands conditional on server_capabilities
	-- if client.server_capabilities.document_highlight then
	-- 	vim.api.nvim_exec(
	-- 		[[
	--      hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
	--      hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
	--      hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
	--      augroup lsp_document_highlight
	--        autocmd! * <buffer>
	--        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	--        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	--      augroup END
	--    ]],
	-- 		false
	-- 	)
	-- end
end

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

-- -- lua
-- lspconfig.lua_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
-- -- js/ts
-- lspconfig.ts_ls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- -- code folding
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local language_servers = {
	"lua_ls",
	-- "ts_ls"
}
-- local language_servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	lspconfig[ls].setup({
		capabilities = capabilities,
		-- you can add other fields for setting up lsp server in this table
		on_attach = on_attach,
	})
end

-- typscript-tools
require("typescript-tools").setup({
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = {},
	settings = {},
})
