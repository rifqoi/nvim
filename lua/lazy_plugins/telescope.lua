return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files in current directory", { silent = true } },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep string inside current directory", { silent = true } },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List all opened buffers.", { silent = true } },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "List help pages", { silent = true } },
		{ "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "Find git files in current project", { silent = true } },
		{ "<leader>dg", "<cmd>Telescope diagnostics<CR>", desc = "List all diagnostics from lsp", { silent = true } },
		{ "<leader>tr", "<cmd>Telescope treesitter<CR>", desc = "Telescope treesitter", { silent = true } },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-e>"] = function(...)
						require("telescope.actions").close(...)
					end,
					["<esc>"] = function(...)
						require("telescope.actions").close(...)
					end,
					["<C-Down>"] = function(...)
						return require("telescope.actions").cycle_history_next(...)
					end,
					["<C-Up>"] = function(...)
						return require("telescope.actions").cycle_history_prev(...)
					end,
					["<C-f>"] = function(...)
						return require("telescope.actions").preview_scrolling_down(...)
					end,
					["<C-b>"] = function(...)
						return require("telescope.actions").preview_scrolling_up(...)
					end,
				},
				n = {
					["<C-e>"] = function(...)
						require("telescope.actions").close(...)
					end,
					["<esc>"] = function(...)
						require("telescope.actions").close(...)
					end,
				},
			},
		},
	},
}
-- vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>", {silent = true})
-- vim.keymap.set("n", "<leader>dg", ":Telescope diagnostics<CR>", {silent = true})
-- -- vim.keymap.set("n",{"gr"}, ":Telescope lsp_references<CR>", {silent=true})
-- vim.keymap.set("n", "tr", ":Telescope treesitter<CR>", {silent = true})
