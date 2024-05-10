return {
	{
		"mbbill/undotree",
		lazy = false,
		keys = {

			{
				"<leader>ut",
				":UndotreeToggle<CR>",
				desc = "Toggle Undo Tree",
				noremap = true,
			},
		},
		init = function()
			vim.g.undotree_SplitWidth = 40
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_CustomUndotreeCmd = "topleft vertical 5 new"
		end,
	},
}
