local mapx = require'mapx'.setup {}
local nnoremap = mapx.nnoremap
local vnoremap = mapx.vnoremap
local xnoremap = mapx.xnoremap

require('go').setup()
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.go"},
	callback = function()
		vim.keymap.set('n', '<leader>gi', ":execute 'GoIfErr' | -3 | delete<CR>",
		               {silent = true})
		vim.keymap.set("n", "<leader>gat", ":execute 'write' | GoAddTag<CR>",
		               {silent = true})
		vim.keymap.set("n", "<leader>gta", ":execute 'GoRmTag' <CR>", {silent = true})
	end,
})
