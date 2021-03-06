-- Colorscheme related
-- require('kanagawa').setup({
-- 	undercurl = true, -- enable undercurls
-- 	commentStyle = {italic = true},
-- 	functionStyle = {},
-- 	keywordStyle = {italic = true},
-- 	statementStyle = {bold = true},
-- 	typeStyle = {},
-- 	variablebuiltinStyle = {italic = true},
-- 	specialReturn = true, -- special highlight for the return keyword
-- 	specialException = true, -- special highlight for exception handling keywords
-- 	transparent = true, -- do not set background color
-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 	globalStatus = false, -- adjust window separators highlight for laststatus=3
-- 	colors = {carpYellow = "#F0C674"},
-- 	overrides = {},
-- })
--
--
--
-- vim.cmd("colorscheme kanagawa")
-- Onedark
-- require("onedark").setup({
-- 	style = "dark",
-- 	code_style = {
-- 		comments = 'italic',
-- 		keywords = 'italic',
-- 		functions = 'italic',
-- 		strings = 'none',
-- 		variables = 'italic',
-- 	},
-- 	-- Custom Highlights --
-- 	colors = {}, -- Override default colors
-- 	highlights = {}, -- Override highlight groups
-- 	-- Plugins Config --
-- 	diagnostics = {
-- 		darker = true, -- darker colors for diagnostic
-- 		undercurl = true, -- use undercurl instead of underline for diagnostics
-- 		background = false, -- use background color for virtual text
-- 	},
-- })
-- require("onedark").load()
-- vim.cmd('colorscheme onedark')
-- require("github-theme").setup({
-- 	theme_style = "dark",
-- 	-- other config
-- })
--
--
--
-- Gruvbox
-- vim.g.gruvbox_italic = 1
-- vim.cmd('colorscheme gruvbox')
--
--
--
--
-- Tokyo Night
-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

-- FloatBorder
vim.cmd([[highlight FloatBorder guibg=None ctermbg=None]])
vim.cmd('hi NormalFloat guibg=None guifg=None')

-- Background
vim.cmd('hi Normal guibg=None')
vim.cmd('hi EndOfBuffer guibg=None')

-- Cursor Number
vim.cmd('hi CursorLine guibg=None')
