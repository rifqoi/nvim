return {
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	enabled = false,
	-- 	-- keys = {
	-- 	-- 	{ "<C-n>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
	-- 	-- },
	-- },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icon
		},
		lazy = false,
		keys = {
			{ "<C-n>", "<cmd>keepjumps NvimTreeToggle<CR>", desc = "Nvim Tree", remap = true },
		},
		opts = {
			view = {
				side = "left",
			},
		},
	},
}
