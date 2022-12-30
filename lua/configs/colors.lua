require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
	term_colors = false,
	dim_inactive = {enabled = false, shade = "dark", percentage = 0.15},
	styles = {
		comments = {"italic"},
		conditionals = {"italic"},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = {enabled = true, show_root = false, transparent_panel = true},
		telescope = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = {"italic"},
				hints = {"italic"},
				warnings = {"italic"},
				information = {"italic"},
			},
			underlines = {
				errors = {"underline"},
				hints = {"underline"},
				warnings = {"underline"},
				information = {"underline"},
			},
		},
		indent_blankline = {enabled = true, colored_indent_levels = false},
		treesitter = true,
		ts_rainbow = true,
		-- beacon = true,
		fidget = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})
vim.cmd.colorscheme("catppuccin")

-- FloatBorder
vim.cmd([[highlight FloatBorder guibg=None ctermbg=None]])
vim.cmd('hi NormalFloat guibg=None guifg=None')

-- Background
vim.cmd('hi Normal guibg=None')
vim.cmd('hi EndOfBuffer guibg=None')

-- Cursor Number
vim.cmd('hi CursorLine guibg=None')
