return {
	"ray-x/go.nvim",
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>gie",
			"<CMD>execute 'GoIfErr' | -3 | delete<CR>",
			desc = "Run Go If Error",
			silent = true,
			mode = { "n" },
		},
		{ "<leader>gat", ":execute 'write' | GoAddTag<CR>", desc = "Run Go Add Tags", silent = true, mode = { "n" } },
		{ "<leader>grt", ":execute 'GoRmTag' <CR>", desc = "Run Go Remove Tags", silent = true, mode = { "n" } },
		{ "<leader>gta", "<CMD>GoAddTest<CR>", desc = "Run Go Add Test for current func", silent = true, mode = { "n" } },
		{ "<leader>gtc", "<CMD>GoTestFunc<CR>", desc = "Test Current Func", silent = true, mode = { "n" } },
		{ "<leader>gtf", "<CMD>GoTestFile<CR>", desc = "Test Current File", silent = true, mode = { "n" } },
		{
			"<leader>gim",
			function()
				local user_input = vim.fn.input("Enter interface: ")
				local goimpl_str = string.format("GoImpl %s", user_input)
				vim.cmd(goimpl_str)
			end,
			desc = "Generate Implementation for current struct",
			silent = true,
			mode = { "n" },
		},
		{ "<leader>s", "<CMD>GoAlt!<CR>", desc = "Switch Toggle between test file", silent = true, mode = { "n" } },
	},

	config = function()
		require("go").setup()

		-- Run gofmt on save
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
}
