local vim = vim
local set = vim.opt

-- set.relativenumber = true
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.tabstop = 4
set.completeopt = {"menu", "menuone", "noselect"}
set.signcolumn = "yes:1"
set.hidden = true
set.mouse = "a"
set.smartindent = true
set.background = "dark"
set.scrolloff = 8

-- Set Prettier
vim.g.neoformat_try_node_exe = 1

vim.g.mapleader = " "

-- Highlight on yank
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END
]])

-- Colorscheme related
-- require("onedark").setup({style = "warmer"})
-- require("onedark").load()
require('kanagawa').setup({
	undercurl = true, -- enable undercurls
	commentStyle = "italic",
	functionStyle = "NONE",
	keywordStyle = "italic",
	statementStyle = "bold",
	typeStyle = "NONE",
	variablebuiltinStyle = "italic",
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = false, -- adjust window separators highlight for laststatus=3
	colors = {},
	overrides = {},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

vim.cmd [[ autocmd BufNewFile,BufRead *.tmpl setf html ]]
-- vim.api.nvim_exec(
-- [[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]], true
-- )
-- vim.cmd 'colorscheme onedark'
-- vim.cmd 'hi Normal guibg=NONE ctermbg=NONE gui=NONE'
-- set.termguicolors = true
