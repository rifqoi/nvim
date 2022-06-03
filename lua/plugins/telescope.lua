local actions = require("telescope.actions")
require('telescope').setup {
	defaults = {
		file_ignore_patterns = {"node_modules"},
		mappings = {
			i = {["<C-e>"] = actions.close, ["<esc>"] = actions.close},
			n = {["<C-e>"] = actions.close, ["<esc>"] = actions.close},
		},
	},
}
