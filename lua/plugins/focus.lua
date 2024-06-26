return {
	{
		"nvim-focus/focus.nvim",
		version = "*",
		lazy = false,
		opts = {
			enable = true, -- Enable module
			commands = true, -- Create Focus commands
			autoresize = {
				enable = true, -- Enable or disable auto-resizing of splits
				width = 0, -- Force width for the focused window
				height = 0, -- Force height for the focused window
				minwidth = 0, -- Force minimum width for the unfocused window
				minheight = 0, -- Force minimum height for the unfocused window
				height_quickfix = 10, -- Set the height of quickfix panel
			},
			split = {
				bufnew = false, -- Create blank buffer for new split windows
				tmux = true, -- Create tmux splits instead of neovim splits
			},
			ui = {
				number = false, -- Display line numbers in the focussed window only
				relativenumber = false, -- Display relative line numbers in the focussed window only
				hybridnumber = false, -- Display hybrid line numbers in the focussed window only
				absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

				cursorline = true, -- Display a cursorline in the focussed window only
				cursorcolumn = false, -- Display cursorcolumn in the focussed window only
				colorcolumn = {
					enable = false, -- Display colorcolumn in the foccused window only
					list = "+1", -- Set the comma-saperated list for the colorcolumn
				},
				signcolumn = false, -- Display signcolumn in the focussed window only
				winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
			},
		},
		init = function()
			local ignore_filetypes = { "undotree", "ZFDirDiff" }
			local ignore_buftypes = { "nofile", "prompt", "popup" }

			local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

			vim.api.nvim_create_autocmd("WinEnter", {
				group = augroup,
				callback = function(_)
					if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
						vim.w.focus_disable = true
					else
						vim.w.focus_disable = false
					end
				end,
				desc = "Disable focus autoresize for BufType",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = augroup,
				callback = function(_)
					if vim.bo.filetype == "undotree" then
						vim.b.focus_disable = true
						vim.api.nvim_win_set_width(0, vim.g.undotree_SplitWidth)
					elseif vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
						vim.b.focus_disable = true
						vim.api.nvim_win_set_width(0, 85)
					else
						vim.b.focus_disable = false
					end
				end,
				desc = "Disable focus autoresize for FileType",
			})
		end,
	},
	{
		"dhruvasagar/vim-zoom",
		lazy = false,
		keys = {
			{
				"<C-w>m",
				"<Plug>(zoom-toggle)<CR>",
				desc = "Zoom to pane.",
				silent = true,
				noremap = true,
			},
		},
	},
}
