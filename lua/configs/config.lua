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
set.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.opt_global.shortmess:remove("F"):append("c")

vim.g.mapleader = " "

-- Highlight on yank
vim.cmd([[
	augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
	augroup END
]])

vim.cmd([[ autocmd BufNewFile,BufRead *.tmpl setf html ]])
-- vim.api.nvim_exec(
-- [[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]], true
-- )
