return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use({ "jdhao/better-escape.vim", event = "InsertEnter" })
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "saadparwaiz1/cmp_luasnip" })
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	-- use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use("b0o/mapx.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	-- use("sbdchd/neoformat")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use({ "ThePrimeagen/harpoon", requires = { { "nvim-lua/plenary.nvim" } } })
	use("windwp/nvim-autopairs")
	use("jalvesaq/Nvim-R")
	use({ "ggandor/leap.nvim" })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
	})
	use({ "lewis6991/gitsigns.nvim" })
	use({ "navarasu/onedark.nvim" })
	use({ "windwp/windline.nvim" })
	use({ "akinsho/bufferline.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "maxmellon/vim-jsx-pretty", requires = { "HerringtonDarkholme/yats.vim", opt = true } })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "andweeb/presence.nvim" })
	use("jose-elias-alvarez/null-ls.nvim")
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

end)
