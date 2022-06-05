local mapx = require'mapx'.setup {}
local nnoremap = mapx.nnoremap
local vnoremap = mapx.vnoremap
local xnoremap = mapx.xnoremap

vim.keymap.set("n", "<leader>z", ":bdel<CR>", {silent = true})
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {silent = true})
vim.keymap.set("n", "Y", "y$", {silent = true})
vim.keymap.set("n", "<expr>:W", ":W<CR>", {silent = true})

-- Yank Clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", {silent = true})
-- vnoremap("<leader>y", "\"+y", {silent=true})

-- Delete from any buffer
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", {silent = true})
-- vnoremap("<leader>d", "\"_d", {silent = true})

-- Paste from system clipboard
vim.keymap.set({"n", "x"}, "<leader>p", "\"+p", {silent = true})
-- xnoremap("<leader>p", "\"+p", {silent = true})
vim.cmd [[command! W write]]
vim.cmd [[command! WQ wq]]
vim.cmd [[command! Q quit]]

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {silent = true})

-- Telescope related
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {silent = true})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {silent = true})
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {silent = true})
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {silent = true})
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", {silent = true})
vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>", {silent = true})
vim.keymap.set("n", "<leader>dg", ":Telescope diagnostics<CR>", {silent = true})
-- vim.keymap.set("n",{"gr"}, ":Telescope lsp_references<CR>", {silent=true})
vim.keymap.set("n", "tr", ":Telescope treesitter<CR>", {silent = true})

-- Remove highlight
vim.keymap.set("n", "<leader>hl", ":nohl<CR>", {silent = true})

-- Tmux
local ft = vim.api.nvim_buf_get_option(0, "filetype")
local file = vim.fn.expand("%")

if ft == "vim" or ft == "lua" then
	local command = ":so %"
	-- vim.keymap.set("n","<leader>cr", string.format(":lua print('%s')<CR>", file) , {silent=true})
	vim.keymap.set("n", "<leader>cr", command .. "<CR>", {silent = true})
elseif ft == "python" then
	local command = ":!tmux select-pane -D && tmux send-keys 'python %s' Enter<CR>"
	vim.keymap
					.set("n", "<leader>cr", string.format(command, file), {silent = true})
elseif ft == "c" then
	vim.cmd("silent! write")
	vim.cmd("sp")
	local output = vim.fn.expand("%:t:r")
	local command = "gcc %s -o %s && ./%s; rm %s"
end
