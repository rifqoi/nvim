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

-- Undotree
vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", {silent = true})

-- Window resize
vim.keymap.set("n", "<leader>=", "<cmd>resize +7<CR>", {silent = true})
vim.keymap.set("n", "<leader>-", "<cmd>resize -7<CR>", {silent = true})
vim.keymap.set("n", "\\=", "<cmd>vertical resize +7<CR>", {silent = true})
vim.keymap.set("n", "\\-", "<cmd>vertical resize -7<CR>", {silent = true})

-- Tmux

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	callback = function()
		local ft = vim.api.nvim_buf_get_option(0, "filetype")
		local file = vim.fn.expand("%")
		if ft == "vim" or ft == "lua" then
			local command = ":so %"
			-- vim.keymap.set("n","<leader>cr", string.format(":lua print('%s')<CR>", file) , {silent=true})
			vim.keymap.set("n", "<leader>rr", command .. "<CR>", {silent = true})
		elseif ft == "python" then
			local run = string.format("python '%s'", file)
			local command = string.format(
							                ":silent !tmux select-pane -D && tmux send-keys \"%s\"  Enter && tmux select-pane -U<CR>",
							                run)
			local command3 = string.format(
							                 ":silent !tmux neww bash -c \"%s 2>/dev/null | less +F\"<CR> ",
							                 run)

			vim.keymap.set("n", "<leader>rr", string.format(command3), {silent = true})
			vim.keymap.set("n", "<leader>rd", string.format(command, file),
			               {silent = true})

		elseif ft == "go" then
			local run = string.format("go run \"%s\"", file)
			local command_bash = string.format(
							                     ":silent !tmux neww bash -c \"%s | less \"<CR>", run)
			local command =
							":silent !tmux select-pane -D && tmux send-keys '%s' Enter && tmux select-pane -U<CR>"

			vim.keymap.set("n", "<leader>rr", string.format(command_bash),
			               {silent = true})
			vim.keymap.set("n", "<leader>rd", string.format(command, run),
			               {silent = true})

		elseif ft == "rmd" then
			local r_console = ":silent !tmux neww -n rconsole -k -t 2 -d R<CR>"
			local render_rmarkdown = string.format(
							                         ":silent !tmux send-keys -t rconsole.0  \"rmarkdown::render('%s')\" Enter && ~/.config/nvim/scripts/cleanup_rmd.sh<CR>",
							                         file)
			vim.keymap.set("n", "<leader>rs", r_console, {silent = true})
			vim.keymap.set("n", "<leader>rr", render_rmarkdown, {silent = true})
		end
	end,
})
