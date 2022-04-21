local vim = vim
local set = vim.opt

-- set.relativenumber = true
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.completeopt = { "menu", "menuone", "noselect" }
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
require("onedark").setup({
	style = "warmer",
})
require("onedark").load()

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
