return {
	{
		"stevearc/conform.nvim",
		enabled = false,
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>mf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				java = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				tex = { "latexindent" },
				lua = { "stylua" },
				markdown = { "prettier" },
				php = { "prettier" },
				python = { "black" },
				rust = { "rustfmt" },
				scss = { "prettier" },
				typst = { "typstfmt" },
				vue = { "prettier" },
				yaml = { "yamlfmt" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat then
					return
				end
				return { lsp_fallback = true, async = false, timeout_ms = 500 }
			end,
			-- formatters = {
			--     latexindent = {
			--         prepend_args = { '-l', '/Users/ilias/.indentconfig.yaml' },
			--     },
			-- },
		},
		init = function()
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				vim.g.disable_autoformat = true
			end, {
				desc = "Disable autoformat-on-save",
			})

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
		end,
	},
	{
		"nvimdev/guard.nvim",
		-- Builtin configuration, optional
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvimdev/guard-collection",
		},
		keys = {
			{
				"<leader>gf",
				":GuardFmt<CR>",
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		config = function(_, opts)
			local ft = require("guard.filetype")

			ft("c"):fmt("clang-format")
			ft("lua"):fmt("stylua")
			ft("yaml"):fmt({
				cmd = "yamlfmt",
				stdin = true,
				args = { "-in" },
			})
			ft("typescript,javascript,typescriptreact"):fmt({
				cmd = "prettierd",
				args = { vim.api.nvim_buf_get_name(0) },
				stdin = true,
			})
			ft("java"):fmt({
				cmd = "google-java-format",
				args = { vim.api.nvim_buf_get_name(0), "-" },
				stdin = true,
			})

			-- Isort for sorting import
			ft("python"):fmt("ruff"):append("isort"):lint("ruff")
			-- ft("go"):fmt("gofmt"):append("golines")

			require("guard").setup({
				-- Choose to format on every write to a buffer
				fmt_on_save = true,
				-- Use lsp if no formatter was defined for this filetype
				lsp_as_default_formatter = false,
				-- By default, Guard writes the buffer on every format
				-- You can disable this by setting:
				-- save_on_fmt = false,
			})
		end,
	},
}
