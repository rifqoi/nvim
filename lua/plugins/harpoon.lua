local mapx = require("mapx").setup({})
local nnoremap = mapx.nnoremap
local vnoremap = mapx.vnoremap
local xnoremap = mapx.xnoremap

nnoremap("<leader>a", ":lua require('harpoon.mark').add_file()<CR>", "silent")
nnoremap("<leader>lh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "silent")
nnoremap("<leader>lt", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", "silent")
nnoremap("<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", "silent")
nnoremap("<C-b>", ":lua require('harpoon.ui').nav_file(2)<CR>", "silent")
nnoremap("<C-l>", ":lua require('harpoon.ui').nav_file(3)<CR>", "silent")
nnoremap("<C-m>", ":lua require('harpoon.ui').nav_file(4)<CR>", "silent")
--nnoremap("<leader>c", ":lua require('harpoon.tmux').sendCommand('{down-of}', 'ls -la \\r')<CR>", "silent")
