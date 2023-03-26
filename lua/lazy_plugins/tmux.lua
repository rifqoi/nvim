return {
	{
		"alexghergh/nvim-tmux-navigation",
		keys = {
			{
				"<C-h>",
				":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>",
				desc = "Ctrl-h to navigate to left pane of tmux or neovim pane",
				silent = true,
				noremap = true,
			},
			{
				"<C-j>",
				":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>",
				desc = "Ctrl-j to navigate to down pane of tmux or neovim pane",
				silent = true,
				noremap = true,
			},
			{
				"<C-k>",
				":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>",
				desc = "Ctrl-k to navigate to up pane of tmux or neovim pane",
				silent = true,
				noremap = true,
			},
			{
				"<C-l>",
				":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
				desc = "Ctrl-l to navigate to right pane of tmux or neovim pane",
				silent = true,
				noremap = true,
			},
			{
				"<C-Space>",
				":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
				desc = "Ctrl-space to navigate to next pane",
				silent = true,
				noremap = true,
			},
		},
	},
    -- {"dhruvasagar/vim-zoom"},
}
