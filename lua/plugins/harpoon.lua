local mapx = require("mapx").setup({})
local nnoremap = mapx.nnoremap
local vnoremap = mapx.vnoremap
local xnoremap = mapx.xnoremap

vim.keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>",
               {silent = true})
vim.keymap.set("n", "<leader>lh",
               ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
               {silent = true})
vim.keymap.set("n", "<leader>lt",
               ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
               {silent = true})
vim.keymap.set("n", "<leader>b", ":lua require('harpoon.ui').nav_file(1)<CR>",
               {silent = true})
vim.keymap.set("n", "<leader>n", ":lua require('harpoon.ui').nav_file(2)<CR>",
               {silent = true})
vim.keymap.set("n", "<leader>m", ":lua require('harpoon.ui').nav_file(3)<CR>",
               {silent = true})
vim.keymap.set("n", "<leader>,", ":lua require('harpoon.ui').nav_file(4)<CR>",
               {silent = true})
-- vim.keymap.set("n","<leader>c", ":lua require('harpoon.tmux').sendCommand('{down-of}', 'ls -la \\r')<CR>", {silent=true})
