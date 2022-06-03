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
require("github-theme").setup({
	theme_style = "dark_default",
	function_style = "italic",
	comment_style = "italic",
	dark_sidebar = true,

	sidebars = {"qf", "vista_kind", "terminal", "packer"},

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = {hint = "orange", error = "#ff0000"},

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
			DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
			-- this will remove the highlight groups
			TSField = {},
		}
	end,
})

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
