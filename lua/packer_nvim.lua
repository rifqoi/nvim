local execute = vim.api.nvim_command

-- don't throw any error on first use by packer
local ok, packer = pcall(require, "packer")
if not ok then return end

-- automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_nvim.lua source <afile> | PackerCompile
  augroup end
]])

-- vim.cmd [[packadd packer.nvim]]
execute('packadd packer.nvim')
local use = packer.use

return packer.startup {
	function()
		use "wbthomason/packer.nvim"

		use {"jdhao/better-escape.vim", event = "InsertEnter"}

		-- Lsp related
		use {"neovim/nvim-lspconfig", config = [[ require('plugins.lspconfig') ]]}
		-- use {
		-- 	'ray-x/navigator.lua',
		-- 	requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
		-- 	config = [[ require("plugins.navigator")]],
		-- }
		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = [[ require("plugins.trouble")]],
		}

		-- CMP completion
		use {"hrsh7th/nvim-cmp", config = [[ require("plugins.cmp") ]]}
		use {"hrsh7th/cmp-nvim-lsp"}
		use {"saadparwaiz1/cmp_luasnip"}
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		-- use {"hrsh7th/cmp-nvim-lsp-signature-help"}
		use 'ray-x/lsp_signature.nvim'
		use "L3MON4D3/LuaSnip"
		use "rafamadriz/friendly-snippets"
		use "onsails/lspkind-nvim"

		-- Autopairs
		use {"windwp/nvim-autopairs", config = [[ require("plugins.autopairs")]]}
		use {"windwp/nvim-ts-autotag", config = [[ require("plugins.autotag")]]}
		use {
			"maxmellon/vim-jsx-pretty",
			requires = {"HerringtonDarkholme/yats.vim", opt = true},
		}
		use 'JoosepAlviste/nvim-ts-context-commentstring'

		use {
			'ray-x/go.nvim',
			requires = {'ray-x/guihua.lua'},
			config = [[ require("plugins.go-nvim") ]],
		}

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[ require("plugins.treesitter")]],
		}
		use 'nvim-treesitter/nvim-treesitter-refactor'

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			requires = {{"nvim-lua/plenary.nvim"}},
			config = [[ require("plugins.telescope")]],
		}

		-- Key mappings
		use "b0o/mapx.nvim"

		-- File tree Nvimtree
		use {
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
			config = function() require("nvim-tree").setup({}) end,
		}

		-- Tpope Plugins
		use("tpope/vim-fugitive")
		use {
			"lewis6991/gitsigns.nvim",
			config = [[ require("plugins.gitsigns-nvim")]],
		}
		use("tpope/vim-rhubarb")
		use("tpope/vim-commentary")
		use("tpope/vim-surround")

		use {
			"lukas-reineke/indent-blankline.nvim",
			config = [[ require("plugins.indent-blankline")]],
		}

		-- DA HARPOON
		use {
			"ThePrimeagen/harpoon",
			requires = {{"nvim-lua/plenary.nvim"}},
			config = [[ require("plugins.harpoon")]],
		}

		-- For r development
		use {"jalvesaq/Nvim-R", config = [[ require("plugins.nvim-r")]]}

		-- Jumpy boi
		use {"ggandor/leap.nvim", config = [[ require("plugins.leap")]]}

		-- Seamless tmux integration
		use {
			"alexghergh/nvim-tmux-navigation",
			config = [[ require("plugins.nvim-tmux")]],
		}

		-- Best colorscheme
		use "navarasu/onedark.nvim"
		use "projekt0n/github-nvim-theme"
		use "rebelot/kanagawa.nvim"

		-- Buffer and status line
		use {"windwp/windline.nvim", config = [[ require('plugins.statusline') ]]}
		use {"akinsho/bufferline.nvim"}

		-- For the flex
		-- use {"andweeb/presence.nvim", config = [[require("plugins.presence")]]}

		-- Formatter
		use {
			"jose-elias-alvarez/null-ls.nvim",
			config = [[ require("plugins.null-ls")]],
		}

		use 'lewis6991/impatient.nvim'
		-- use {
		-- 	"smjonas/inc-rename.nvim",
		-- 	config = function() require("inc_rename").setup() end,
		-- }
	end,
}
