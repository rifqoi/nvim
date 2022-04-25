-- local actions = require("telescope.actions")
-- local trouble = require("trouble.providers.telescope")

-- local telescope = require("telescope")

-- telescope.setup({
-- 	defaults = {
-- 		mappings = {
-- 			i = { ["<c-t>"] = trouble.open_with_trouble },
-- 			n = { ["<c-t>"] = trouble.open_with_trouble },
-- 		},
-- 	},
-- })
-- Lua
require("trouble").setup({})
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
