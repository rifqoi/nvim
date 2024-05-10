local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

return function(opts)
	opts = vim.tbl_deep_extend("force", {
		spec = {
			{ import = "plugins" },
		},
		defaults = { lazy = true },
		checker = { enabled = false },
		diff = { cmd = "git" },
		performance = {
			cache = {
				enabled = true,
				-- disable_events = {},
			},
			rtp = {
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					-- "netrwPlugin",
					"rplugin",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	}, opts or {})
	require("lazy").setup(opts)
end
