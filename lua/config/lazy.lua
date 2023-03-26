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
			-- { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {} },
			-- { import = "lazyvim.plugins.extras.lang.typescript" },
			-- { import = "lazyvim.plugins.extras.linting.eslint" },
			-- { import = "lazyvim.plugins.extras.formatting.prettier" },
			-- { import = "lazyvim.plugins.extras.lang.json" },
			-- {import = "lazyvim.plugins.extras.ui.mini-animate"},
			{ import = "lazy_plugins" },
		},
		defaults = { lazy = true },
		install = { colorscheme = { "tokyonight", "habamax" } },
		checker = { enabled = true },
		diff = { cmd = "terminal_git" },
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
					"netrwPlugin",
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
	vim.cmd.colorscheme("catppuccin")
end
