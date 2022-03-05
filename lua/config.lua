local set = vim.opt

-- set.relativenumber = true
set.number = true
set.shiftwidth = 4
set.completeopt = {'menu','menuone','noselect'}
set.signcolumn = "yes:1"
vim.g.mapleader = ' '

vim.cmd 'colorscheme gruvbox'
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'highlight clear SignColumn'
