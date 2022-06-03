local mapx = require'mapx'.setup {}
local nnoremap = mapx.nnoremap
local vnoremap = mapx.vnoremap
local xnoremap = mapx.xnoremap

nnoremap("<leader>z", ":bdel<CR>", "silent")
nnoremap("<C-n>", ":NvimTreeToggle<CR>", "silent")
nnoremap("Y", "y$", "silent")
nnoremap("<expr>:W", ":W<CR>", "silent")

-- Yank Clipboard
nnoremap("<leader>y", "\"+y", "silent")
vnoremap("<leader>y", "\"+y", "silent")

-- Delete from any buffer
nnoremap("<leader>d", "\"_d", "silent")
vnoremap("<leader>d", "\"_d", "silent")

-- Paste from system clipboard
nnoremap("<leader>p", "\"+p", "silent")
xnoremap("<leader>p", "\"+p", "silent")
vim.cmd [[command! W write]]
vim.cmd [[command! WQ wq]]
vim.cmd [[command! Q quit]]

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv", "silent")
vnoremap("K", ":m '<-2<CR>gv=gv", "silent")

-- Telescope related
nnoremap({"<leader>ff", "<C-f>f"}, ":Telescope find_files<CR>", "silent")
nnoremap({"<leader>fg"}, ":Telescope live_grep<CR>", "silent")
nnoremap({"<leader>fb"}, ":Telescope buffers<CR>", "silent")
nnoremap({"<leader>fh"}, ":Telescope help_tags<CR>", "silent")
nnoremap({"<leader>lo"}, ":Telescope oldfiles<CR>", "silent")
nnoremap({"<leader>gf"}, ":Telescope git_files<CR>", "silent")
nnoremap({"<leader>dg"}, ":Telescope diagnostics<CR>", "silent")
-- nnoremap({"gr"}, ":Telescope lsp_references<CR>", "silent")
nnoremap({"tr"}, ":Telescope treesitter<CR>", "silent")

-- Remove highlight
nnoremap({"<leader>hl"}, ":nohl<CR>", "silent")

-- Tmux
local ft = vim.api.nvim_buf_get_option(0, "filetype")
local file = vim.fn.expand("%")

if ft == "vim" or ft == "lua" then
	local command = ":so %"
	-- nnoremap("<leader>cr", string.format(":lua print('%s')<CR>", file) , "silent")
	nnoremap("<leader>cr", command .. "<CR>", "silent")
elseif ft == "python" then
	local command = ":!tmux select-pane -D && tmux send-keys 'python %s' Enter<CR>"
	nnoremap("<leader>cr", string.format(command, file), "silent")
elseif ft == "c" then
	vim.cmd("silent! write")
	vim.cmd("sp")
	local output = vim.fn.expand("%:t:r")
	local command = "gcc %s -o %s && ./%s; rm %s"
end
