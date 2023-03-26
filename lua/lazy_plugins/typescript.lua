return {
	-- correctly setup lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = { "jose-elias-alvarez/typescript.nvim" },
		opts = {
			-- make sure mason installs the server
			servers = {
				---@type lspconfig.options.tsserver
				tsserver = {
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				},
			},
			setup = {
				tsserver = function(_, opts)
					require("util").on_attach(function(client, buffer)
						if client.name == "tsserver" then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
              -- stylua: ignore
              vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
						end
					end)
					require("typescript").setup({ server = opts })
					return true
				end,
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			table.insert(opts.sources, require("typescript.extensions.null-ls.code-actions"))
		end,
	},
}
