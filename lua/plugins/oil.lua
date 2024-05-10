return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		keymaps = {
			["q"] = "actions.close",
			["<esc>"] = "actions.close",
		},
	},
	keys = { { "-", "<cmd>Oil --float<cr>", desc = "Fugitive git status" } },

	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
