return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	opts = {
		-- Your options go here
		-- name = "venv",
		-- auto_refresh = false
		-- stay_on_this_version = true,
		-- anaconda_base_path = "/opt/homebrew/Caskroom/miniconda/base",
		-- anaconda_envs_path = "/opt/homebrew/Caskroom/miniconda/base/envs",
		notify_user_on_venv_activation = true, -- notifies user on activation of the virtual env
		debug = true,
	},
	branch = "regexp", -- This is the regexp branch, use this for the new version
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
