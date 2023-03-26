return {
	{
		"ray-x/go.nvim",
		ft = "go",
		config = function()
			require("go").setup()
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.go" },
				callback = function()
					vim.keymap.set("n", "<leader>gi", ":execute 'GoIfErr' | -3 | delete<CR>", { silent = true })
					vim.keymap.set("n", "<leader>gat", ":execute 'write' | GoAddTag<CR>", { silent = true })
					vim.keymap.set("n", "<leader>gta", ":execute 'GoRmTag' <CR>", { silent = true })
				end,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.go" },
				callback = function()
					local params = vim.lsp.util.make_range_params(nil, "utf-16")
					params.context = { only = { "source.organizeImports" } }
					local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
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
		end,
	},
}
