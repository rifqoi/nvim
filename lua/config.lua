local set = vim.opt

-- set.relativenumber = true
set.number = true
set.shiftwidth = 4
set.completeopt = {'menu','menuone','noselect'}
set.signcolumn = "yes:1"
vim.g.mapleader = ' '

-- Highlight on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END
]]

-- Colorscheme related
vim.cmd 'colorscheme gruvbox'
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'highlight clear SignColumn'
set.termguicolors = true
