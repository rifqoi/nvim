local mapx = require("mapx").setup({})
local nnoremap = mapx.nnoremap
local harpoon = require("harpoon")
local tmux = harpoon.tmux

local ft = vim.api.nvim_buf_get_option(0, "filetype")
local file = vim.fn.expand("%")
local opts = { noremap=true, silent=true }

if ft == "vim" or ft == "lua" then
	nnoremap("<leader>cr", string.format(":lua print('bruh')"), "silent")
elseif ft == "python" then
	local command = string.format("python %s \n", file)
	local mapping = vim.api.nvim_set_keymap("n","<leader>cr", tmux.sendCommand("{down-of}", command), "silent")
	vim.cmd(string.format("autocmd FileType python %s", mapping))
end
