local set = vim.opt
set.relativenumber = true
set.number = true
set.shiftwidth = 4
set.completeopt = {'menu','menuone','noselect'}
vim.g.mapleader = ' '

vim.cmd 'colorscheme gruvbox'
vim.cmd 'highlight clear SignColumn'
