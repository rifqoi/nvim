require("config.opts")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")({
	debug = false,
	defaults = { lazy = true },
	performance = { cache = { enabled = true } },
})
