vim.cmd("let R_openpdf = 1")
vim.cmd("let R_external_term = 1")
vim.cmd(
				"let R_external_term = 'tmux kill-window -t rconsole | tmux neww -n rconsole -d'")
vim.cmd("let R_notmuxconf = 1")
local current_file = vim.fn.expand("%")
vim.cmd(string.format("autocmd BufWritePre *.Rmd RSend rmarkdown::render('%s')",
                      current_file))
