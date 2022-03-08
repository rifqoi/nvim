return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {'jdhao/better-escape.vim', event = 'InsertEnter'}
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
	use 'onsails/lspkind-nvim'
	use 'L3MON4D3/LuaSnip'
	use "rafamadriz/friendly-snippets"
	use {
	    'nvim-treesitter/nvim-treesitter',
	    run = ':TSUpdate'
	}
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'b0o/mapx.nvim'
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
	    config = function() require'nvim-tree'.setup {} end
	}
	use 'sbdchd/neoformat'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use { 'ThePrimeagen/harpoon',
	    requires= { {'nvim-lua/plenary.nvim'}}
	}
	use 'windwp/nvim-autopairs'
	use 'jalvesaq/Nvim-R'
end)

