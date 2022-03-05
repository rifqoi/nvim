require'mapx'.setup{ global = true }

nnoremap({"<leader>ff", "<C-f>f"}, ":Telescope find_files<CR>", "silent")
nnoremap({"<leader>fg"}, ":Telescope live_grep<CR>", "silent")
nnoremap({"<leader>fb"}, ":Telescope buffers<CR>", "silent")
nnoremap({"<leader>fh"}, ":Telescope help_tags<CR>", "silent")


