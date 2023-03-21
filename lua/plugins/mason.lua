-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then return end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig =
				pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then return end
-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then return end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"sumneko_lua",
		"gopls",
		"tsserver",
		"html",
		"tailwindcss",
		"dockerls",
		"sqls",
		"terraformls",
		"bashls",
		"pyright",
		"golangci_lint_ls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettierd", -- ts/js formatter
		"lua-format",
		"gofmt",
		"black",
		-- "rustfmt", -- Switch to rust-analyzer's formatter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
