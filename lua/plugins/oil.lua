return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		keymaps = {
			["q"] = "actions.close",
			["<esc>"] = "actions.close",
			["<C-v>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			["g."] = { "actions.toggle_hidden", mode = "n" },
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
			-- This function defines what is considered a "hidden" file
			is_hidden_file = function(name, bufnr)
				return vim.startswith(name, ".")
			end,
			-- This function defines what will never be shown, even when `show_hidden` is set
			is_always_hidden = function(name, bufnr)
				if name == ".git" then
					return true
				end

				return false
			end,
			-- Sort file names in a more intuitive order for humans. Is less performant,
			-- so you may want to set to false if you work with large directories.
			natural_order = false,
			sort = {
				-- sort order can be "asc" or "desc"
				-- see :help oil-columns to see which columns are sortable
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
	},
	keys = { { "-", "<cmd>Oil --float<cr>", desc = "Open oil window" } },

	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
