-- LSP Config
--
local protocol = require("vim.lsp.protocol")
protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Window Border
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- Do not forget to use the on_attach function
local function border(hl_name)
	return {
		{"╭", hl_name},
		{"─", hl_name},
		{"╮", hl_name},
		{"│", hl_name},
		{"╯", hl_name},
		{"─", hl_name},
		{"╰", hl_name},
		{"│", hl_name},
	}
end

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
	                                      {border = border "FloatBorder"}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
	                                              {border = border "FloatBorder"}),
}

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<space>e",
                        "<cmd>lua vim.diagnostic.open_float({border = 'rounded'})<CR>",
                        opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
                        opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>",
                        opts)
vim.api.nvim_set_keymap("n", "<space>q",
                        "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD",
	                            "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>",
	                            opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
	                            "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi",
	                            "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-p>",
	                            "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa",
	                            "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
	                            opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr",
	                            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
	                            opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wl",
	                            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
	                            opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D",
	                            "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn",
	                            "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca",
	                            ":lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>",
	                            opts)
	-- nnoremap({"gr"}, ":Telescope lsp_references<CR>", "silent")
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f",
	--                             "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp
				                                                                  .protocol
				                                                                  .make_client_capabilities())
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- vim.cmd("autocmd BufNewFile,BufRead *.cshtml set syntax=html")

local servers = {
	"gopls",
	"tsserver",
	"html",
	"tailwindcss",
	"dockerls",
	"sqls",
	"terraform_lsp",
	"bashls",
	"golangci_lint_ls",
	"bufls",
}

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then return end
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
		handlers = handlers,
	})
end

-- lspconfig.eslint.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	handlers = handlers,
-- 	flags = {
-- 		-- This will be the default in neovim 0.7+
-- 		debounce_text_changes = 150,
-- 	},
-- 	settings = {},
-- 	codeAction = {
-- 		disableRuleComment = {enable = true, location = "separateLine"},
-- 		showDocumentation = {enable = true},
-- 	},
-- 	codeActionOnSave = {enable = false, mode = "all"},
-- 	format = true,
-- 	nodePath = "",
-- 	onIgnoredFiles = "off",
-- 	packageManager = "npm",
-- 	quiet = false,
-- 	rulesCustomizations = {},
-- 	run = "onType",
-- 	useESLintClass = false,
-- 	validate = "on",
-- 	workingDirectory = {mode = "location"},
-- })

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	settings = {Lua = {diagnostics = {globals = {'vim', 'bit', 'packer_plugins'}}}},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	settings = {
		python = {
			analysis = {
				-- autoSearchPaths = true,
				-- diagnosticMode = "workspace",
				-- useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
			},
		},
	},
})

-- lspconfig.pylsp.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	flags = {
-- 		-- This will be the default in neovim 0.7+
-- 		debounce_text_changes = 150,
-- 	},
-- 	settings = {
-- 		-- configure plugins in pylsp
-- 		pylsp = {plugins = {pycodestyle = {enabled = false}}},
-- 	},
-- 	handlers = handlers,
-- }

lspconfig.yamlls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.yaml",

			},
		},
	},
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {"*.go"},
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, "utf-16")
		params.context = {only = {"source.organizeImports"}}
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params,
		                                        3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})

-- clangd_capabilities.textDocument.semanticHighlighting = true
-- clangd_capabilities.offsetEncoding = "utf-8"

-- lspconfig.clangd.setup {
-- 	capabilities = clangd_capabilities,
-- 	on_attach = on_attach,
-- 	cmd = {
-- 		"clangd",
-- 		"--background-index",
-- 		"--pch-storage=memory",
-- 		"--clang-tidy",
-- 		"--suggest-missing-includes",
-- 		"--cross-file-rename",
-- 		"--completion-style=detailed",
-- 		"--function-arg-placeholders=0",
-- 	},
-- 	init_options = {
-- 		clangdFileStatus = true,
-- 		usePlaceholders = true,
-- 		completeUnimported = true,
-- 		semanticHighlighting = true,
-- 	},
-- }
