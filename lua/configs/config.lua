local vim = vim
local set = vim.opt

-- set.relativenumber = true
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = true
set.completeopt = {"menu", "menuone", "noselect"}
set.signcolumn = "yes:1"
set.hidden = true
set.mouse = "a"
set.smartindent = true
set.background = "dark"
set.scrolloff = 8
set.termguicolors = true
set.cursorline = true
set.undodir = os.getenv("HOME") .. ".vim/undodir"

vim.g.mapleader = " "

-- Highlight on yank
vim.cmd([[
	augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
	augroup END
]])

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

-- Onedark
require("onedark").setup({
	style = "dark",
	code_style = {
		comments = 'italic',
		keywords = 'italic',
		functions = 'italic',
		strings = 'none',
		variables = 'italic',
	},
	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups
	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = false, -- use background color for virtual text
	},
})
require("onedark").load()
vim.cmd('colorscheme onedark')

-- require("github-theme").setup({
-- 	theme_style = "dark",
-- 	-- other config
-- })

vim.cmd([[highlight FloatBorder guibg=None ctermbg=None]])
vim.cmd('hi NormalFloat guibg=None guifg=None')
vim.cmd('hi Normal guibg=None')
vim.cmd('hi EndOfBuffer guibg=None')
vim.cmd('hi CursorLine guibg=None')

vim.cmd([[ autocmd BufNewFile,BufRead *.tmpl setf html ]])
-- vim.api.nvim_exec(
-- [[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]], true
-- )
