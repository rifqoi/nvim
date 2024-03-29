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

execute('packadd packer.nvim')
local use = packer.use

return packer.startup {
	function()
		use("wbthomason/packer.nvim")

		use({"jdhao/better-escape.vim", event = "InsertEnter"})

		use({
			"neovim/nvim-lspconfig",
			config = function() require('plugins.lspconfig') end,
		})

		use({
			"williamboman/mason.nvim",
			config = function() require('plugins.mason') end,
		})

		use({"williamboman/mason-lspconfig.nvim"})

		-- Formatter
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function() require("plugins.null-ls") end,
		})
		use({"jayp0521/mason-null-ls.nvim"})

		-- use({
		-- 	'j-hui/fidget.nvim',
		-- 	config = function() require("fidget").setup {window = {blend = 0}} end,
		-- })

		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function() require("plugins.trouble") end,
		})

		-- CMP completion
		use({"hrsh7th/nvim-cmp", config = function() require("plugins.cmp") end})
		use({"hrsh7th/cmp-nvim-lsp"})
		use({"saadparwaiz1/cmp_luasnip"})
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use({"hrsh7th/cmp-nvim-lsp-signature-help"})
		use('ray-x/lsp_signature.nvim')
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")
		use("onsails/lspkind-nvim")

		-- Autopairs
		use({
			"windwp/nvim-autopairs",
			config = function() require("plugins.autopairs") end,
		})
		use({
			"windwp/nvim-ts-autotag",
			config = function() require("plugins.autotag") end,
		})
		use({
			"maxmellon/vim-jsx-pretty",
			requires = {"HerringtonDarkholme/yats.vim", opt = true},
		})
		use('JoosepAlviste/nvim-ts-context-commentstring')

		use({
			'ray-x/go.nvim',
			requires = {'ray-x/guihua.lua'},
			config = function() require("plugins.go-nvim") end,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function() require("plugins.treesitter") end,
		})
		use('nvim-treesitter/nvim-treesitter-refactor')
		use('nvim-treesitter/nvim-treesitter-context')
		use('p00f/nvim-ts-rainbow')

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = {{"nvim-lua/plenary.nvim"}},
			config = function() require("plugins.telescope") end,
		})

		-- Key mappings
		use("b0o/mapx.nvim")

		-- File tree Nvimtree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
			config = function() require("nvim-tree").setup({}) end,
		})

		-- Tpope Plugins
		use("tpope/vim-fugitive")
		use({
			"lewis6991/gitsigns.nvim",
			config = function() require("plugins.gitsigns-nvim") end,
		})
		use("tpope/vim-rhubarb")
		use("tpope/vim-commentary")
		use("tpope/vim-surround")
		use("tpope/vim-abolish")

		use({
			"lukas-reineke/indent-blankline.nvim",
			-- config = function() require("plugins.indent-blankline") end,
		})

		-- DA HARPOON
		use({
			"ThePrimeagen/harpoon",
			requires = {{"nvim-lua/plenary.nvim"}},
			config = function() require("plugins.harpoon") end,
		})

		-- Seamless tmux integration
		use({
			"alexghergh/nvim-tmux-navigation",
			config = function() require("plugins.nvim-tmux") end,
		})

		-- Best colorscheme
		use {"catppuccin/nvim", as = "catppuccin"}
		use("danilamihailov/beacon.nvim")

		-- Buffer and status line
		-- use({
		-- 	"windwp/windline.nvim",
		-- 	config = function() require('plugins.statusline') end,
		-- })
		use({
			'feline-nvim/feline.nvim',
			config = function() require("plugins.feline") end,
		})
		use({
			"akinsho/bufferline.nvim",
			after = "catppuccin",
			config = function()
				require("bufferline").setup {
					highlights = require("catppuccin.groups.integrations.bufferline").get(),
				}
			end,
		})

		-- For the flex
		use({
			"andweeb/presence.nvim",
			config = function() require("plugins.presence") end,
		})

		use 'lewis6991/impatient.nvim'
		use('dhruvasagar/vim-zoom')
		use("hashivim/vim-terraform")
		use("mbbill/undotree")
	end,
}
