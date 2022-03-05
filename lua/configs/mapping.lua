require'mapx'.setup{ global = true }

nnoremap({"<leader>ff", "<C-f>f"}, ":Telescope find_files<CR>", "silent")
nnoremap({"<leader>fg"}, ":Telescope live_grep<CR>", "silent")
nnoremap({"<leader>fb"}, ":Telescope buffers<CR>", "silent")
nnoremap({"<leader>fh"}, ":Telescope help_tags<CR>", "silent")
nnoremap("<leader>x", ":bdel<CR>", "silent")
nnoremap("<C-n>", ":NvimTreeToggle<CR>", "silent")
nnoremap("Y", "y$", "silent")


-- Yank Clipboard
nnoremap("<leader>y", "\"+y", "silent")
vnoremap("<leader>y", "\"+y", "silent")


-- Delete from any buffer
nnoremap("<leader>d", "\"_d", "silent")
vnoremap("<leader>d", "\"_d", "silent")

-- Paste from system clipboard
nnoremap("<leader>p", "\"+p", "silent")
xnoremap("<leader>p", "\"+p", "silent")

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv", "silent")
vnoremap("K", ":m '<-2<CR>gv=gv", "silent")


