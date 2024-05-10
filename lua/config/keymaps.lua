vim.keymap.set("n", "<leader>z", ":bdel<CR>", { silent = true })
vim.keymap.set("n", "Y", "y$", { silent = true })
vim.keymap.set("n", "<expr>:W", ":W<CR>", { silent = true })

-- Yank Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true })

-- Paste from system clipboard
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { silent = true })
--
-- Diagnostic float
vim.api.nvim_set_keymap(
	"n",
	"<space>e",
	"<cmd>lua vim.diagnostic.open_float({border = 'rounded'})<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>hl", ":nohl<CR>", { silent = true })
vim.keymap.set("n", "<leader>lr", function()
	vim.cmd("LspRestart")
    vim.notify("LSP Restarted.")
end, { silent = true })
