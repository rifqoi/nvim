local mapx = require'mapx'.setup {}
local nnoremap = mapx.nnoremap
local vnoremap = mapx.vnoremap
local xnoremap = mapx.xnoremap

require('go').setup()
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.go"},
	callback = function()
		nnoremap("<leader>gi", ":execute 'GoIfErr' | -3 | delete<CR>", "silent")
	end,
})
