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
-- vim.cmd("colorscheme kanagawa")
--
--
--
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
-- Rose Pine
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {ColorColumn = {bg = 'rose'}},
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')

-- github theme
--
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
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
-- -- Load the colorscheme
-- vim.cmd [[colorscheme tokyonight]]
-- local theme = {}

-- theme.colors = {
-- 	bg = "#0b0f10",
-- 	fg = "#C5C8C9",
-- 	red = "#ee6a70",
-- 	green = "#96d6b0",
-- 	yellow = "#ffb29b",
-- 	blue = "#7ba5dd",
-- 	magenta = "#cb92f2",
-- 	cyan = "#7fc8db",

-- 	-- Alternative colors
-- 	darkerBg = "#080c0d",
-- 	darkestBg = "#05090a",
-- 	bgAlt = "#101415",
-- 	bgAlt2 = "#131718",
-- 	bgAlt3 = "#151a1c",
-- 	fgAlt = "#c4c4c4",
-- 	fgAlt2 = "#b7b8b8",
-- 	funnyGreen = "#91e6b1",

-- 	-- Base16
-- 	base00 = "#0b0f10",
-- 	base01 = "#26292a",
-- 	base02 = "#3e4141",
-- 	base03 = "#6e7071",
-- 	base04 = "#6e7071",
-- 	base05 = "#9fa0a0",
-- 	base06 = "#b7b8b8",
-- 	base07 = "#C5C8C9",
-- }

-- local colors = theme.colors
-- -- Colors
-- local darkestBg = colors.darkestBg
-- local _bg = colors.bg
-- local bgAlt = colors.bgAlt
-- local bgAlt2 = colors.bgAlt2
-- local _fg = colors.fg
-- -- local fgAlt2 = bgAlt2

-- local red = colors.red
-- local green = colors.green
-- local yellow = colors.yellow
-- local blue = colors.blue
-- local magenta = colors.magenta
-- local cyan = colors.cyan

-- local dbFg = "#a89984"
-- local folderFg = "#DCB67A"

-- local function fg(group, color) vim.cmd("hi " .. group .. " guifg=" .. color) end

-- local function bg(group, color) vim.cmd("hi " .. group .. " guibg=" .. color) end

-- local function fgbg(group, fgcol, bgcol)
-- 	vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
-- end

-- LSP
-- fg("LspDiagnosticsSignHint", magenta)
-- fg("LspDiagnosticsVirtualTextHint", magenta)

-- -- -- Dashboard
-- -- fg("DashboardHeader", "#6e7071")
-- -- fg("DashboardCenter", "#b7b8b8")
-- -- fg("DashboardShortcut", "#6e7071")
-- -- fg("DashboardFooter", dbFg)

-- -- GitSigns
-- fgbg("GitSignsAdd", green, _bg)
-- fgbg("GitSignsChange", blue, _bg)
-- fgbg("GitSignsChangeDelete", red, _bg)
-- fgbg("GitSignsDelete", red, _bg)

-- -- Indent
-- fg("IndentBlanklineChar", colors.base01)

-- -- Bufferline
-- bg("BufferlineDirectory", darkestBg)

-- -- NvimTree
-- fg("NvimTreeFolderIcon", folderFg)
-- fg("NvimTreeFolderName", colors.base05)
-- fg("NvimTreeOpenedFolderName", colors.base05)
-- fg("NvimTreeEmptyFolderName", colors.base05)
-- fg("NvimTreeFileDirty", red)
-- fg("NvimTreeExecFile", _fg)
-- fg("NvimTreeGitDirty", red)
-- fg("NvimTreeGitDeleted", red)
-- fg("NvimTreeRootFolder", colors.base04)
-- fg("NvimTreeIndentMarker", colors.base01)
-- bg("NvimTreeNormal", darkestBg)
-- fgbg("NvimTreeVertSplit", darkestBg, darkestBg)
-- fgbg("NvimTreeStatusLine", _bg, _bg)
-- fgbg("NvimTreeEndOfBuffer", darkestBg, darkestBg)
-- vim.cmd("hi NvimTreeStatusLineNC gui=underline guifg=" .. _bg .. " guibg=" ..
-- 				        _bg)

-- FloatBorder
vim.cmd([[highlight FloatBorder guibg=None ctermbg=None]])
vim.cmd('hi NormalFloat guibg=None guifg=None')

-- Background
vim.cmd('hi Normal guibg=None')
vim.cmd('hi EndOfBuffer guibg=None')

-- Cursor Number
vim.cmd('hi CursorLine guibg=None')
