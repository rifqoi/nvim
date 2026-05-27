return {
	{
		"stevearc/conform.nvim",
		-- enabled = false,
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
				python = { "ruff_format", "ruff_organize_imports" },
				rust = { "rustfmt" },
				scss = { "prettier" },
				typst = { "typstfmt" },
				vue = { "prettier" },
				yaml = { "yamlfmt" },
				sql = { "sqlfmt" },
				nix = { "alejandra" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 3000, lsp_format = "fallback" }
				-- return { lsp_fallback = true, async = false, timeout_ms = 500 }
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
	-- {
	-- 	"nvimdev/guard.nvim",
	-- 	-- Builtin configuration, optional
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = {
	-- 		"nvimdev/guard-collection",
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>gf",
	-- 			":Guard fmt<CR>",
	-- 			mode = "",
	-- 			desc = "[F]ormat buffer",
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		local ft = require("guard.filetype")
	--
	-- 		ft("c"):fmt("clang-format")
	-- 		ft("lua"):fmt("stylua")
	-- 		ft("yaml"):fmt({
	-- 			cmd = "yamlfmt",
	-- 			stdin = true,
	-- 			args = { "-in" },
	-- 		})
	-- 		ft("typescript,javascript,typescriptreact"):fmt({
	-- 			cmd = "prettierd",
	-- 			args = { vim.api.nvim_buf_get_name(0) },
	-- 			stdin = true,
	-- 		})
	-- 		ft("java"):fmt({
	-- 			cmd = "google-java-format",
	-- 			args = { vim.api.nvim_buf_get_name(0), "-" },
	-- 			stdin = true,
	-- 		})
	-- 		ft("elixir", {
	-- 			lsp_as_default_formatter = true,
	-- 		})
	--
	-- 		-- Isort for sorting import
	-- 		ft("python"):fmt("ruff"):append("isort")
	-- 		-- ft("go"):fmt("gofmt"):append("golines")
	-- 		--
	-- 		vim.g.guard_config = {
	-- 			-- format on write to buffer
	-- 			fmt_on_save = true,
	-- 			-- use lsp if no formatter was defined for this filetype
	-- 			lsp_as_default_formatter = false,
	-- 			-- whether or not to save the buffer after formatting
	-- 			save_on_fmt = true,
	-- 		}
	-- 	end,
	-- },
}
